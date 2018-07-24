import 'package:flutter/material.dart';
import 'main.dart';

//Name Entry
void nameBlock (String value){
  name = value;
  print(name);
}

//Level Entry
void levelBlock(String value){
  level = value;
  print(level);
}

//This Year CTC after removing PLI
void ctcBlock (double value){
  double originalCTC = value;   //Original CTC
  double newPLI;
  switch(level){
    case 'M-11':
      newPLI = (originalCTC * 12.5)/100;
      break;
    case 'M-10':
      newPLI = (originalCTC * 12.5)/100;
      break;
    case "M-9":
      newPLI = (originalCTC * 12.5)/100;
      break;
    case "M-08":
      newPLI = (originalCTC * 20.0)/100;
      break;
    case "M-07":
      newPLI = (originalCTC * 25.0)/100;
      break;
    case "M-06":
      newPLI = (originalCTC * 25.0)/100;
      break;
  }
  //finalCIC = originalCTC - newPLI;  //Final CTC after Removing current Year PLI
  finalCTC = value;
  print(finalCTC);
}

//Last Year PLI including High PLI
void pliBlock (double value){
  pli = value;
  print (pli);
}

//Extra Bonus annually
void bonusBlock (double value){
  bonus = value;
  print (bonus);
}

//Monthly Basic Salary kept during CTC Restructure
void basicBlock (double value){
  basic = value;  // Basic per Month
  print(basic);
}

//BER Allowance
void berAllowance(double value){
  //Annual
  if(value!=null){
    ber = value;
    ber = ber *12;
  }else{
    ber=0.0;
  }

  print(ber);
}

//Food Coupons
void foodCoupons(double value){
  foodcoupon = value;
  foodcoupon = foodcoupon *12; //Annual
  print(foodcoupon);
}

//Washing Allowance
void washingAllowance (bool value){
  if (value==true){
    switch(level){
      case 'M-11':
        washingAllowan = 1000.0*12;
        break;
      case 'M-10':
        washingAllowan = 1000.0*12;
        break;
      case "M-9":
        washingAllowan = 1000.0*12;
        break;
      case "M-08":
        washingAllowan = 1000.0*12;
        break;
      case "M-07":
        washingAllowan = 1000.0*12;
        break;
      case "M-06":
        washingAllowan = 1000.0*12;
        break;
    }
  }else {
    washingAllowan = 0.0;
  }

  print(washingAllowan);
}

//HRA calculation
void hra(double value){
  double hraCase1 = basic * 0.5 * 12;  // case-1 50% of Basic
  double hraCase2 = basic * 0.4 *12;   // case-2 40% of Basic as per Gov Rule
  double hraCase3 = (value - (basic * 0.1))*12; // case-3 Rent Paid - 10% of Basic

  if(value==0.0){
    hraFinal = 0.0;
  } else{
    if(hraCase3<=hraCase2){
      hraFinal = hraCase3 ;
    }else {
      if(hraCase2<=hraCase1){
        hraFinal = hraCase2;
      }else{
        hraFinal = hraCase1;
      }

    }
  }
  print(hraFinal);
}

//Medical Allowance
void medicalAllowance(bool value){
  if (value==true){
    medicalAllowan = 15000.0;
    }else
      {
        medicalAllowan = 0.0;
      }

      print(medicalAllowan);
}
void childAllowance(bool value){
  if (value==true){
    childAllow = 1200.0+3600.0;
  }else
  {
    childAllow = 0.0;
  }
  print(childAllow);
}

//LTA Option
void lta (bool value){
  if (value==true){
    ltaFinal = 15000.0;
  }else
  {
    ltaFinal = 0.0;
  }

  print(ltaFinal);
}


// savings (pending)
void savings (double value){
  pf= basic * 0.12;  // calculating PF considering 12% of Basic
  pf = pf* 12.0;  // PF Annually
  saving = value+pf;
  double maxLim = 150000.0;
  if(saving>=maxLim){
      saving = maxLim;
  }else{
    saving = saving;
  }
}

// Tax calculations (pending)
 void taxCalculations (){
  totalTaxableIncome = finalCTC + pli + bonus - pf - foodcoupon - ber; //Calculating Total Taxable Income
  aggOfChapVI = saving;   // pf + Saving
  exemptionUS10 = hraFinal + washingAllowan + childAllow ;   // Child Fee + Child Hostel + hra + washing Allowance
  taxableIncome = totalTaxableIncome - aggOfChapVI - exemptionUS10 -medicalAllowan - proTax - ltaFinal - 40000.0;  //40,000 is std deduction by gov.

  //case-1 If taxableIncome is <2,50,000  = 0.0 Tax
  //case-2 if taxableIncome is >2,50,000 || <5,00,000 = (taxableIncome- 500000)*0.05
  //case-3 if taxableIncome is >5,00,000 || <10,00,000 = (taxableIncome- 500000)*0.20+12500
  //case-4 if taxableIncome is >10,00,000 = (taxableIncome- 1000000)*0.30+112500

   if(taxableIncome <250000.0){
     incomeTax = 0.0;
   }else{
     if((taxableIncome >250000.0) && (taxableIncome <500000.0)){
       incomeTax=(taxableIncome- 500000)*0.05;
       surcharge = incomeTax *0.04;
     }else{
       if((taxableIncome >500000.0) && (taxableIncome <1000000.0)){
         incomeTax=((taxableIncome- 500000)*0.20)+12500.0;
         surcharge = incomeTax *0.04;
       }else{
         incomeTax=((taxableIncome- 1000000)*0.30)+112500.0;
         surcharge = incomeTax *0.04;
       }
     }
   }
}

class Calculation extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
