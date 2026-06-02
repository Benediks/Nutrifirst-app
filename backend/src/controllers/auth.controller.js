import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { prisma } from '../lib/prisma.js';

const isProduction = process.env.NODE_ENV === 'production';


const cookieOptions = {
  httpOnly: true,
  secure: isProduction,
  sameSite: isProduction ? 'none' : 'lax',
  maxAge: 7 * 24 * 60 * 60 * 1000, // 7 hari
  path: '/',
};

// ============================================================
// Email Validation Helpers
// ============================================================
const EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const MAX_EMAIL_LENGTH = 254;  // RFC 5321

function validateEmail(email) {
  if (typeof email !== 'string') {
    return { valid: false, error: 'Email harus berupa teks.' };
  }
  const trimmed = email.trim().toLowerCase();
  if (!trimmed) {
    return { valid: false, error: 'Email wajib diisi.' };
  }
  if (trimmed.length > MAX_EMAIL_LENGTH) {
    return { valid: false, error: 'Email terlalu panjang.' };
  }
  if (!EMAIL_REGEX.test(trimmed)) {
    return { valid: false, error: 'Format email tidak valid. Contoh: nama@domain.com' };
  }
  return { valid: true, email: trimmed };
}

function generateToken(user) {
  return jwt.sign(
    { userId: user.id, email: user.email },
    process.env.JWT_SECRET,
    { expiresIn: process.env.JWT_EXPIRES_IN || '7d' }
  );
}


// POST /api/auth/register

export async function register(req, res) {
  try {
    const { email: rawEmail, password, name } = req.body;

    // Validasi email
    const emailCheck = validateEmail(rawEmail);
    if (!emailCheck.valid) {
      return res.status(400).json({ message: emailCheck.error });
    }
    const email = emailCheck.email;  // sudah ter-trim & lowercase

    // Validasi name & password
    if (!name || typeof name !== 'string' || name.trim().length < 2) {
      return res.status(400).json({ message: 'Nama wajib diisi (min 2 karakter).' });
    }
    if (!password || password.length < 6) {
      return res.status(400).json({ message: 'Password minimal 6 karakter.' });
    }
    if (password.length > 100) {
      return res.status(400).json({ message: 'Password terlalu panjang (max 100 karakter).' });
    }

    // Cek duplikat (sekarang case-insensitive karena sudah lowercase)
    const existing = await prisma.user.findUnique({ where: { email } });
    if (existing) {
      return res.status(409).json({ message: 'Email sudah terdaftar.' });
    }

    const hashed = await bcrypt.hash(password, 10);
    const user = await prisma.user.create({
      data: { email, password: hashed, name: name.trim() },
      select: { id: true, email: true, name: true, createdAt: true },
    });

    const token = generateToken(user);
    res.cookie('token', token, cookieOptions);

    return res.status(201).json({ message: 'Registrasi berhasil', user });
  } catch (err) {
    console.error('Register error:', err);
    return res.status(500).json({ message: 'Terjadi kesalahan server.' });
  }
}


// POST /api/auth/login

export async function login(req, res) {
  try {
    const { email: rawEmail, password } = req.body;

    // Validasi email (untuk normalisasi case-insensitive saat lookup)
    const emailCheck = validateEmail(rawEmail);
    if (!emailCheck.valid) {
      // Pesan generik untuk security — jangan bocorkan apakah email valid format
      return res.status(401).json({ message: 'Email atau password salah.' });
    }
    const email = emailCheck.email;

    if (!password) {
      return res.status(401).json({ message: 'Email atau password salah.' });
    }

    const user = await prisma.user.findUnique({ where: { email } });
    if (!user) {
      return res.status(401).json({ message: 'Email atau password salah.' });
    }

    const match = await bcrypt.compare(password, user.password);
    if (!match) {
      return res.status(401).json({ message: 'Email atau password salah.' });
    }

    const token = generateToken(user);
    res.cookie('token', token, cookieOptions);
    return res.json({
      message: 'Login berhasil',
      user: { id: user.id, email: user.email, name: user.name },
    });
  } catch (err) {
    console.error('Login error:', err);
    return res.status(500).json({ message: 'Terjadi kesalahan server.' });
  }
}


// POST /api/auth/logout

export async function logout(req, res) {
  res.clearCookie('token', { ...cookieOptions, maxAge: 0 });
  return res.json({ message: 'Logout berhasil' });
}


// GET /api/auth/me  (Protected)

export async function me(req, res) {
  try {
    const user = await prisma.user.findUnique({
      where: { id: req.user.userId },
      select: { id: true, email: true, name: true, createdAt: true },
    });
    if (!user) {
      return res.status(404).json({ message: 'User tidak ditemukan.' });
    }
    return res.json({ user });
  } catch (err) {
    console.error('Me error:', err);
    return res.status(500).json({ message: 'Terjadi kesalahan server.' });
  }
}
