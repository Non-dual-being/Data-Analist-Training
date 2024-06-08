def bereken_bmi(gewicht, lengte):
    """
    Bereken de Body Mass Index (BMI).

    Parameters:
    gewicht (int): Gewicht in kilogrammen
    lengte (float): Lengte in meters

    Returns:
    float: De berekende BMI
    """
    if not isinstance(gewicht, int):
        raise TypeError("Gewicht moet een geheel getal (int) zijn")
    if not isinstance(lengte, float):
        raise TypeError("Lengte moet een kommagetal (float) zijn")
    if lengte <= 0:
        raise ValueError("Lengte moet groter zijn dan 0")
    if gewicht <= 0:
        raise ValueError("Gewicht moet groter zijn dan 0")

    bmi = gewicht / (lengte ** 2)
    return bmi

def beoordeel_bmi(bmi):
    """
    Beoordeel de BMI.

    Parameters:
    bmi (float): De berekende BMI

    Returns:
    str: De beoordeling van de BMI
    """
    if bmi < 18.5:
        return "Ondergewicht"
    elif 18.5 <= bmi < 25:
        return "Normaal gewicht"
    elif 25 <= bmi < 30:
        return "Overgewicht"
    else:
        return "Obesitas"

def bereken_en_beoordeel_bmi(gewicht, lengte):
    """
    Bereken en beoordeel de BMI.

    Parameters:
    gewicht (int): Gewicht in kilogrammen
    lengte (float): Lengte in meters

    Returns:
    tuple: De berekende BMI en de beoordeling
    """
    bmi = bereken_bmi(gewicht, lengte)
    beoordeling = beoordeel_bmi(bmi)
    return bmi, beoordeling

# Voorbeeldgebruik
try:
    gewicht = int(input("Voer uw gewicht in kilogrammen in (geheel getal): "))
    lengte = float(input("Voer uw lengte in meters in (kommagetal): "))
    
    bmi, beoordeling = bereken_en_beoordeel_bmi(gewicht, lengte)
    
    print(f"Uw BMI is: {bmi:.2f}")
    print(f"Beoordeling: {beoordeling}")
except ValueError as ve:
    print(f"Fout bij invoer: {ve}")
except TypeError as te:
    print(f"Typefout: {te}")
