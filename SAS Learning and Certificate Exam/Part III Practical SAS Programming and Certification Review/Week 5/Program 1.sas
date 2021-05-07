data profit;
  length Customer_Continent $ 20;
  set cr.orders cr.orders2017(rename=
         (Line=Procut_Line Category=Product_Category));
  length Order_Source $ 8;
  where Delivery_Date>=Order_Date;
  Customer_Country=upcase(Customer_Country);
  if Quantity<0 then Quantity=.;
  Profit=(Retail_Price-Cost_Price)*Quantity;
  format Profit dollar12.2;
  ShipDays=Delivery_Date-Order_Date;
  Age_Range=substr(Customer_Age_Group,1,5);
  if Order_Type=1 then Order_Source="Retail";
  else if Order_Type=2 then Order_Source="Phone";
  else Order_Source="Unknown";
  drop Retail_Price Cost_Price Customer_Age_Group Order_Type;
run;
