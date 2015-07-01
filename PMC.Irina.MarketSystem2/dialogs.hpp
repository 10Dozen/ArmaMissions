class dzn_market_dialog
{
	idd=-1;
	movingenable=true;
	
	class controls 
	{		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by 10Dozen, v1.063, #Wugida)
		////////////////////////////////////////////////////////

		class dzn_market_frame: RscFrame
		{
			idc = 1800;
			x = 0.310417 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.364583 * safezoneW;
			h = 0.168 * safezoneH;
			colorBackground[] = {0,0,1,1};
			colorActive[] = {0,0,1,1};
		};
		class dzn_market_textbox: RscText
		{
			idc = 1100;
			text = "Purchase 17 items for total cost $3440"; //--- ToDo: Localize;
			x = 0.325 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.335417 * safezoneW;
			h = 0.084 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class dzn_market_button_yes: RscButton
		{
			idc = 1600;
			text = "PURCHASE"; //--- ToDo: Localize;
			x = 0.325 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.0729167 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class dzn_market_button_no: RscButton
		{
			idc = 1601;
			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.5875 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.0729167 * safezoneW;
			h = 0.028 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

