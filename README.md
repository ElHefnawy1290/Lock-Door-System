# 🔒 Smart Digital Door Lock System

![Status](https://img.shields.io/badge/Status-Completed-success) ![Device](https://img.shields.io/badge/Device-PIC16F877A-blue) ![Language](https://img.shields.io/badge/Language-Embedded_C-orange)

## 🎥 Project Live Demo
> **👇 Watch the full system in action!**

[

https://github.com/user-attachments/assets/368186a3-1165-470d-8518-d646523c8dac

]

---

## 📌 Overview
[cite_start]A secure, keyless entry system designed using the **PIC16F877A** microcontroller[cite: 38]. [cite_start]This project implements a robust **Finite State Machine (FSM)** [cite: 201] to handle user authentication, database management, and system security. [cite_start]It features non-volatile memory storage (EEPROM) for passwords and a "Suspended Mode" to prevent brute-force attacks[cite: 70, 71].

## 🚀 Key Features
* [cite_start]**Secure Access:** 4-Digit PIN authentication via 4x4 Keypad[cite: 69].
* **Role-Based Control:**
    * [cite_start]**User Mode:** Door access only[cite: 184].
    * [cite_start]**Admin Mode:** Full database management (Add/Delete Users)[cite: 188].
* [cite_start]**Brute-Force Protection:** System enters "Suspended Mode" (60-second lockout) after 3 failed attempts[cite: 270, 281].
* [cite_start]**Persistent Storage:** User passwords are saved in internal **EEPROM**, surviving power cuts[cite: 70, 305].
* [cite_start]**RAM Optimization:** Custom drivers store UI strings in ROM (Flash) to save limited RAM[cite: 315, 317].
* [cite_start]**Software PWM:** Custom signal generation for Servo Motor control[cite: 258].

## 🛠️ Hardware Components
| Component | Function |
| :--- | :--- |
| **PIC16F877A** | [cite_start]Main Microcontroller [cite: 76] |
| **4x4 Keypad** | [cite_start]PIN Input [cite: 77] |
| **16x2 LCD** | [cite_start]Visual Feedback & Menu [cite: 83] |
| **Servo Motor** | [cite_start]Lock Actuator [cite: 79] |
| **EEPROM** | [cite_start]Internal Password Storage [cite: 81] |
| **Buzzer** | [cite_start]Security Alarm [cite: 53] |
| **LEDs (Red/Green)**| [cite_start]Status Indicators [cite: 54, 55] |

### 🔌 Circuit Diagram
> *The complete Proteus simulation schematic.*

![Circuit Diagram](Proteus_Design.png)

## ⚙️ How It Works (State Machine)
[cite_start]The system operates in three main states[cite: 207]:

1.  **STATE_LOGIN (Default):**
    * [cite_start]Waits for User PIN[cite: 202].
    * [cite_start]**Correct:** Opens Door (Servo 180°), Green LED ON[cite: 25].
    * [cite_start]**Wrong:** Red LED Blinks[cite: 238].
    * [cite_start]**3x Wrong:** Triggers `STATE_LOCKED`[cite: 31].

2.  **STATE_ADMIN:**
    * [cite_start]Accessible via Master Key (`0000`)[cite: 188].
    * [cite_start]**Add User:** Finds the first empty memory slot (`0xFF`) and saves the new key[cite: 291].
    * [cite_start]**Delete User:** Overwrites the specific user slot with `0xFF`[cite: 303].

3.  **STATE_LOCKED (Suspended):**
    * [cite_start]Locks all input for 60 seconds[cite: 270].
    * [cite_start]Activates Buzzer and Red LED[cite: 33, 34].
    * [cite_start]Displays countdown timer on LCD[cite: 32].

## 👨‍💻 The Team
[cite_start]This project was successfully delivered by [cite: 348-355]:
* **Amira Salah Mohamed Selim Ramon**
* **Raghad Tariq Amin Ali Abdullah Hassouna**
* **Rodina Hossam Ahmed Abbas Hamza**
* **Abdullah Ahmed Mohamed Al-Saeed Al-Shishtawy**
* **Amr Khaled Mostafa El-Hefnawy**
* **Mostafa Ahmed Mostafa Khaira**
* **Mohannad Mohamed Al-Sayed Abdelkarim**
* **Youssef Mohamed Atallah Hegazy**
