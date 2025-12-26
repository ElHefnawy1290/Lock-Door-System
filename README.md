# 🔒 Smart Digital Door Lock System

![Status](https://img.shields.io/badge/Status-Completed-success) ![Device](https://img.shields.io/badge/Device-PIC16F877A-blue) ![Language](https://img.shields.io/badge/Language-Embedded_C-orange)

## 🎥 Project Live Demo
> **👇 Watch the full system in action!**


https://github.com/user-attachments/assets/368186a3-1165-470d-8518-d646523c8dac


---

## 📌 Overview
A secure, keyless entry system designed using the **PIC16F877A** microcontroller. This project implements a robust **Finite State Machine (FSM)** to handle user authentication, database management, and system security. It features non-volatile memory storage (EEPROM) for passwords and a "Suspended Mode" to prevent brute-force attacks.

## 🚀 Key Features
* **Secure Access:** 4-Digit PIN authentication via 4x4 Keypad.
* **Role-Based Control:**
    * **User Mode:** Door access only.
    * **Admin Mode:** Full database management (Add/Delete Users).
* **Brute-Force Protection:** System enters "Suspended Mode" (60-second lockout) after 3 failed attempts.
* **Persistent Storage:** User passwords are saved in internal **EEPROM**, surviving power cuts.
* **RAM Optimization:** Custom drivers store UI strings in ROM (Flash) to save limited RAM.
* **Software PWM:** Custom signal generation for Servo Motor control.

## 🛠️ Hardware Components
| Component | Function |
| :--- | :--- |
| **PIC16F877A** | Main Microcontroller  |
| **4x4 Keypad** | PIN Input  |
| **16x2 LCD** | Visual Feedback & Menu  |
| **Servo Motor** | Lock Actuator |
| **EEPROM** | Internal Password Storage |
| **Buzzer** | Security Alarm |
| **LEDs (Red/Green)**| Status Indicators |

### 🔌 Circuit Diagram
> *The complete Proteus simulation schematic.*

![Circuit Diagram](Proteus_Design.png)

## ⚙️ How It Works (State Machine)
The system operates in three main states:

1.  **STATE_LOGIN (Default):**
    * Waits for User PIN.
    * **Correct:** Opens Door (Servo 180°), Green LED ON.
    * **Wrong:** Red LED Blinks.
    * **3x Wrong:** Triggers `STATE_LOCKED`.

2.  **STATE_ADMIN:**
    * Accessible via Master Key (`0000`).
    * **Add User:** Finds the first empty memory slot (`0xFF`) and saves the new key.
    * **Delete User:** Overwrites the specific user slot with `0xFF`.

3.  **STATE_LOCKED (Suspended):**
    * Locks all input for 60 seconds.
    * Activates Buzzer and Red LED.
    * Displays countdown timer on LCD.

## 👨‍💻 The Team
This project was successfully delivered by:
* **Amira Salah Mohamed Selim Ramon**
* **Raghad Tariq Amin Ali Abdullah Hassouna**
* **Rodina Hossam Ahmed Abbas Hamza**
* **Abdullah Ahmed Mohamed Al-Saeed Al-Shishtawy**
* **Amr Khaled Mostafa El-Hefnawy**
* **Mostafa Ahmed Mostafa Khaira**
* **Mohannad Mohamed Al-Sayed Abdelkarim**
* **Youssef Mohamed Atallah Hegazy**
