# **ACITY GO: A Transport System Database for Academic City University **
### **Subtitle: “Convenience is our Priority”**



---

## **About ACITY GO**
Developed by **DataXfer**, an innovative database consulting firm, **ACITY GO** tackles the pressing transportation challenges at Academic City University. By addressing issues like unreliable and delayed transit services, ACITY GO provides a fast, reliable, and efficient transportation system powered by a robust, well-designed database.

**Our Vision**: To streamline transport for students and staff, making convenience and reliability our utmost priority.

---

## **Methodology**

We used the **Entity-Relationship Model (ER Model)** to design our database system. The database schema incorporates **normalization** to eliminate redundancies and ensure data integrity. The relationships between entities mirror real-world interactions, providing an accurate representation of the transportation ecosystem.

---

## **Entities and Attributes**

### 1. **Vehicle**
- `PlateNo` (PK)
- `Type`
- `Colour`
- `ComfortLevel`

### 2. **Driver**
- `DriverID` (PK)
- `Name`
- `PhoneNumber`
- `LicenseNo`

### 3. **Route**
- `RouteID` (PK)
- `StreetName`
- `GPS`
- `DepartureTime`
- `ArrivalTime`

### 4. **Passenger**
- `StudentID` (PK)
- `Name`
- `PhoneNumber`
- `Time`
- `DepartureLocation`
- `ArrivalLocation`

### 5. **RideDetails**
- `RideID` (PK)
- `DriverID` (FK)
- `PlateNo` (FK)
- `StartTime`
- `EndTime`
- `StartLocation`
- `EndLocation`

### 6. **Payment**
- `PaymentID` (PK)
- `RideID` (FK)
- `PaymentType` (Cash, MoMo, Credit Card)
- `Amount`
- `PaymentDate`

---

## **Diagrams**

### **ER Diagram**


### **Relationships**
- **One-to-Many:**
  - **Driver → RideDetails**: A driver can manage multiple rides.
  - **Passenger → RideDetails**: A passenger can take multiple rides.
  - **Vehicle → RideDetails**: A vehicle can be used for multiple rides.
  - **RideDetails → Payment**: Each ride has one payment record.

- **Many-to-One:**
  - **Route → RideDetails**: Multiple rides may occur on a single route.

- **One-to-One:**
  - **RideDetails → Payment**: Each ride corresponds to one payment.

---

## **Key Takeaways**
### **How ACITY GO Improves Transport**
- Enhances convenience and reliability for students and staff.
- Provides a structured, data-driven approach to managing transportation systems.

### **Future Goals**
- Full implementation of the system with extended options (buses, electric scooters, bikes, etc.).
- Expansion to other university locations.
