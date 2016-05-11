<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="15008000">
	<Property Name="varPersistentID:{2654A840-9E30-43ED-AE0B-6A0FEBED7E90}" Type="Ref">/My Computer/Network Shared Variables.lvlib/FPGA Trigger</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="calc_variables.vi" Type="VI" URL="../calc_variables.vi"/>
		<Item Name="filter_peaks.vi" Type="VI" URL="../filter_peaks.vi"/>
		<Item Name="FPGA Target" Type="FPGA Target">
			<Property Name="AutoRun" Type="Bool">false</Property>
			<Property Name="configString.guid" Type="Str">{084B1062-4A20-4FB2-8021-921708DF0C1E}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1{10E1CFBB-1AD5-4216-AF3C-179B50844C2A}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1{11C98952-A059-45B5-8C5E-7AEB67A90482}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{17C3A0B9-BDFB-4B0D-B9E7-825C0B6AF754}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1{2162DAB2-77DD-41C3-AC08-0D65243AF157}"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"{31D8356C-3C5E-4FF5-A22C-206D1324EE7B}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1{3A981A4F-A5FF-406F-AE80-D5B89D36D067}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1{3F7647C3-FE02-4DE4-860F-1A1E62F74CDF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1{4343D6C8-20FF-4333-9B06-A9CC26D85E04}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1{468A03BA-8ADE-43A1-844E-3B36D4E61443}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1{4804425F-112E-4382-B1CB-7001FB309597}"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"{4F7F334C-9740-480D-86E5-4B0D4F943AA3}NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1{61FADCE9-EB30-4590-8F2B-2312EE0D85D4}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1{67D8D00E-0C54-4D49-A90F-4255283C5AB7}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1{697A5EA5-186F-41BF-B601-49B68CB77712}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1{699283BF-E2EC-4E7D-AB61-744A6FB126CD}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1{715EF477-65A6-48C6-8092-446228953984}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1{743C76C8-415E-4A8F-80D5-224E02C1BEE7}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1{78F09531-B3E0-4BA4-809F-47A899AAD328}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1{7EC8CF3F-C472-4DF5-A906-0A078F567EAA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1{80673867-92CD-4ED8-A698-F378E4C4A3BF}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1{82C01DCA-269A-4A48-B601-6B7325590A37}"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"{8852D604-CA5F-4C40-B41D-FA7D9B830968}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1{988936CC-148D-472E-9B03-FC773BDB55B1}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1{9F0368A3-0177-4227-866B-D59CECFF4ACA}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1{A22905E4-B634-47B7-ADC3-D261FA5AAC73}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1{A2E4D33D-97FD-43F3-9A6B-71F0CEA5698E}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1{B0FDB237-63CF-48EC-A428-74ED3534F8C6}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1{C106E6B9-32E3-495D-B286-9A025262EBFF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1{C3B4415D-7601-4C0D-AAE3-8FED78FFCEE8}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1{D10753BC-9423-43A9-948B-9CEF5429D999}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1{D533ED2C-FE14-4E34-809F-580FF97D40DA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA</Property>
			<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;BoxCar"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"Clock100 PLL UnlockedNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1DeflectionPlates"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"Device 12V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1Device 3.3V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1Device TemperatureNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1EEPROM Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1Expected IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1Inserted IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1IO Module IO EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1IO Module Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1IO Module Power GoodNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1IO Module PresentNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1Offset"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"PXI_Clk10NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1PXI_StarNumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1PXI_Trig0ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1PXI_Trig1ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1PXI_Trig2ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1PXI_Trig3ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXI_Trig4ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1PXI_Trig5ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1PXI_Trig6ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1PXI_Trig7ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1PXIe_DStarBNumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1PXIe_DStarCArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1PXIe_Sync100NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGATDC Local AssertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1TDC Local DeassertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1TDC Pulse Width ValidNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1TDC Pulse WidthNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1</Property>
			<Property Name="NI.FPGA.79XXR.ConfiguredIOModule" Type="Str">IOModuleID:0x109375BC,Version:,National Instruments::NI 5782,SyncClock:CLK10</Property>
			<Property Name="NI.LV.FPGA.CompileConfigString" Type="Str">PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA</Property>
			<Property Name="NI.LV.FPGA.Version" Type="Int">6</Property>
			<Property Name="NI.SortType" Type="Int">1</Property>
			<Property Name="Resource Name" Type="Str">PXI1Slot2</Property>
			<Property Name="Target Class" Type="Str">PXIe-7971R</Property>
			<Property Name="Top-Level Timing Source" Type="Str">40 MHz Onboard Clock</Property>
			<Property Name="Top-Level Timing Source Is Default" Type="Bool">true</Property>
			<Item Name="Board IO" Type="Folder">
				<Item Name="Clock100 PLL Unlocked" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/Board IO/Clock100 PLL Unlocked</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{3A981A4F-A5FF-406F-AE80-D5B89D36D067}</Property>
				</Item>
				<Item Name="Device 3.3V Power" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/Board IO/Device 3.3V Power</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{C106E6B9-32E3-495D-B286-9A025262EBFF}</Property>
				</Item>
				<Item Name="Device 12V Power" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/Board IO/Device 12V Power</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{3F7647C3-FE02-4DE4-860F-1A1E62F74CDF}</Property>
				</Item>
				<Item Name="Device Temperature" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/Board IO/Device Temperature</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{31D8356C-3C5E-4FF5-A22C-206D1324EE7B}</Property>
				</Item>
			</Item>
			<Item Name="IO Module Status" Type="Folder">
				<Item Name="EEPROM Power Enabled" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module Status/EEPROM Power Enabled</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{084B1062-4A20-4FB2-8021-921708DF0C1E}</Property>
				</Item>
				<Item Name="Expected IO Module ID" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module Status/Expected IO Module ID</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{8852D604-CA5F-4C40-B41D-FA7D9B830968}</Property>
				</Item>
				<Item Name="Inserted IO Module ID" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module Status/Inserted IO Module ID</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{A22905E4-B634-47B7-ADC3-D261FA5AAC73}</Property>
				</Item>
				<Item Name="IO Module IO Enabled" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module Status/IO Module IO Enabled</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{C3B4415D-7601-4C0D-AAE3-8FED78FFCEE8}</Property>
				</Item>
				<Item Name="IO Module Power Enabled" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module Status/IO Module Power Enabled</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{78F09531-B3E0-4BA4-809F-47A899AAD328}</Property>
				</Item>
				<Item Name="IO Module Power Good" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module Status/IO Module Power Good</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{80673867-92CD-4ED8-A698-F378E4C4A3BF}</Property>
				</Item>
				<Item Name="IO Module Present" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/IO Module Status/IO Module Present</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{715EF477-65A6-48C6-8092-446228953984}</Property>
				</Item>
			</Item>
			<Item Name="PXI" Type="Folder">
				<Item Name="PXI_Clk10" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/PXI/PXI_Clk10</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{10E1CFBB-1AD5-4216-AF3C-179B50844C2A}</Property>
				</Item>
				<Item Name="PXI_Star" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/PXI/PXI_Star</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{B0FDB237-63CF-48EC-A428-74ED3534F8C6}</Property>
				</Item>
				<Item Name="PXI_Trig0" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="ArbitrationForOutputEnable">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputEnable">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/PXI/PXI_Trig0</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{61FADCE9-EB30-4590-8F2B-2312EE0D85D4}</Property>
				</Item>
				<Item Name="PXI_Trig1" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="ArbitrationForOutputEnable">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputEnable">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/PXI/PXI_Trig1</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{7EC8CF3F-C472-4DF5-A906-0A078F567EAA}</Property>
				</Item>
				<Item Name="PXI_Trig2" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="ArbitrationForOutputEnable">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputEnable">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/PXI/PXI_Trig2</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{699283BF-E2EC-4E7D-AB61-744A6FB126CD}</Property>
				</Item>
				<Item Name="PXI_Trig3" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="ArbitrationForOutputEnable">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputEnable">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/PXI/PXI_Trig3</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{D533ED2C-FE14-4E34-809F-580FF97D40DA}</Property>
				</Item>
				<Item Name="PXI_Trig4" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="ArbitrationForOutputEnable">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputEnable">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/PXI/PXI_Trig4</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{A2E4D33D-97FD-43F3-9A6B-71F0CEA5698E}</Property>
				</Item>
				<Item Name="PXI_Trig5" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="ArbitrationForOutputEnable">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputEnable">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/PXI/PXI_Trig5</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{17C3A0B9-BDFB-4B0D-B9E7-825C0B6AF754}</Property>
				</Item>
				<Item Name="PXI_Trig6" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="ArbitrationForOutputEnable">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputEnable">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/PXI/PXI_Trig6</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{743C76C8-415E-4A8F-80D5-224E02C1BEE7}</Property>
				</Item>
				<Item Name="PXI_Trig7" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="ArbitrationForOutputEnable">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputEnable">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/PXI/PXI_Trig7</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{D10753BC-9423-43A9-948B-9CEF5429D999}</Property>
				</Item>
			</Item>
			<Item Name="PXIe" Type="Folder">
				<Item Name="PXIe_DStarB" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/PXIe/PXIe_DStarB</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{697A5EA5-186F-41BF-B601-49B68CB77712}</Property>
				</Item>
				<Item Name="PXIe_DStarC" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/PXIe/PXIe_DStarC</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{468A03BA-8ADE-43A1-844E-3B36D4E61443}</Property>
				</Item>
				<Item Name="PXIe_Sync100" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/PXIe/PXIe_Sync100</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{4F7F334C-9740-480D-86E5-4B0D4F943AA3}</Property>
				</Item>
			</Item>
			<Item Name="TDC IO" Type="Folder">
				<Item Name="TDC Local Assert" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/TDC IO/TDC Local Assert</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{67D8D00E-0C54-4D49-A90F-4255283C5AB7}</Property>
				</Item>
				<Item Name="TDC Local Deassert" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForOutputData">
   <Value>1</Value>
   </Attribute>
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/TDC IO/TDC Local Deassert</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{988936CC-148D-472E-9B03-FC773BDB55B1}</Property>
				</Item>
				<Item Name="TDC Pulse Width" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/TDC IO/TDC Pulse Width</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{4343D6C8-20FF-4333-9B06-A9CC26D85E04}</Property>
				</Item>
				<Item Name="TDC Pulse Width Valid" Type="Elemental IO">
					<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>Auto</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/TDC IO/TDC Pulse Width Valid</Value>
   </Attribute>
</AttributeSet>
</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{9F0368A3-0177-4227-866B-D59CECFF4ACA}</Property>
				</Item>
			</Item>
			<Item Name="40 MHz Onboard Clock" Type="FPGA Base Clock">
				<Property Name="FPGA.PersistentID" Type="Str">{11C98952-A059-45B5-8C5E-7AEB67A90482}</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig" Type="Str">ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.Accuracy" Type="Dbl">100</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.ClockSignalName" Type="Str">Clk40</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.MaxDutyCycle" Type="Dbl">50</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.MaxFrequency" Type="Dbl">40000000</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.MinDutyCycle" Type="Dbl">50</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.MinFrequency" Type="Dbl">40000000</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.NominalFrequency" Type="Dbl">40000000</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.PeakPeriodJitter" Type="Dbl">250</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.ResourceName" Type="Str">40 MHz Onboard Clock</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.SupportAndRequireRuntimeEnableDisable" Type="Bool">false</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.TopSignalConnect" Type="Str">Clk40</Property>
				<Property Name="NI.LV.FPGA.BaseTSConfig.VariableFrequency" Type="Bool">false</Property>
				<Property Name="NI.LV.FPGA.Valid" Type="Bool">true</Property>
				<Property Name="NI.LV.FPGA.Version" Type="Int">5</Property>
			</Item>
			<Item Name="BoxCar" Type="FPGA FIFO">
				<Property Name="Actual Number of Elements" Type="UInt">37</Property>
				<Property Name="Arbitration for Read" Type="UInt">2</Property>
				<Property Name="Arbitration for Write" Type="UInt">2</Property>
				<Property Name="Control Logic" Type="UInt">0</Property>
				<Property Name="Data Type" Type="UInt">3</Property>
				<Property Name="Disable on Overflow/Underflow" Type="Bool">false</Property>
				<Property Name="fifo.configuration" Type="Str">"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"</Property>
				<Property Name="fifo.configured" Type="Bool">true</Property>
				<Property Name="fifo.projectItemValid" Type="Bool">true</Property>
				<Property Name="fifo.valid" Type="Bool">true</Property>
				<Property Name="fifo.version" Type="Int">12</Property>
				<Property Name="FPGA.PersistentID" Type="Str">{2162DAB2-77DD-41C3-AC08-0D65243AF157}</Property>
				<Property Name="Implementation" Type="UInt">2</Property>
				<Property Name="Local" Type="Bool">false</Property>
				<Property Name="Memory Type" Type="UInt">2</Property>
				<Property Name="Number of Elements" Type="UInt">37</Property>
				<Property Name="Number Of Elements Per Read" Type="UInt">1</Property>
				<Property Name="Number Of Elements Per Write" Type="UInt">1</Property>
				<Property Name="Requested Number of Elements" Type="UInt">37</Property>
				<Property Name="Type" Type="UInt">0</Property>
				<Property Name="Type Descriptor" Type="Str">1000800000000001000940030003493332000100000000000000000000</Property>
			</Item>
			<Item Name="construct_constant_array.vi" Type="VI" URL="../construct_constant_array.vi">
				<Property Name="configString.guid" Type="Str">{084B1062-4A20-4FB2-8021-921708DF0C1E}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1{10E1CFBB-1AD5-4216-AF3C-179B50844C2A}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1{11C98952-A059-45B5-8C5E-7AEB67A90482}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{17C3A0B9-BDFB-4B0D-B9E7-825C0B6AF754}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1{2162DAB2-77DD-41C3-AC08-0D65243AF157}"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"{31D8356C-3C5E-4FF5-A22C-206D1324EE7B}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1{3A981A4F-A5FF-406F-AE80-D5B89D36D067}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1{3F7647C3-FE02-4DE4-860F-1A1E62F74CDF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1{4343D6C8-20FF-4333-9B06-A9CC26D85E04}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1{468A03BA-8ADE-43A1-844E-3B36D4E61443}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1{4804425F-112E-4382-B1CB-7001FB309597}"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"{4F7F334C-9740-480D-86E5-4B0D4F943AA3}NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1{61FADCE9-EB30-4590-8F2B-2312EE0D85D4}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1{67D8D00E-0C54-4D49-A90F-4255283C5AB7}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1{697A5EA5-186F-41BF-B601-49B68CB77712}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1{699283BF-E2EC-4E7D-AB61-744A6FB126CD}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1{715EF477-65A6-48C6-8092-446228953984}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1{743C76C8-415E-4A8F-80D5-224E02C1BEE7}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1{78F09531-B3E0-4BA4-809F-47A899AAD328}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1{7EC8CF3F-C472-4DF5-A906-0A078F567EAA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1{80673867-92CD-4ED8-A698-F378E4C4A3BF}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1{82C01DCA-269A-4A48-B601-6B7325590A37}"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"{8852D604-CA5F-4C40-B41D-FA7D9B830968}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1{988936CC-148D-472E-9B03-FC773BDB55B1}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1{9F0368A3-0177-4227-866B-D59CECFF4ACA}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1{A22905E4-B634-47B7-ADC3-D261FA5AAC73}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1{A2E4D33D-97FD-43F3-9A6B-71F0CEA5698E}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1{B0FDB237-63CF-48EC-A428-74ED3534F8C6}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1{C106E6B9-32E3-495D-B286-9A025262EBFF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1{C3B4415D-7601-4C0D-AAE3-8FED78FFCEE8}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1{D10753BC-9423-43A9-948B-9CEF5429D999}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1{D533ED2C-FE14-4E34-809F-580FF97D40DA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA</Property>
				<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;BoxCar"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"Clock100 PLL UnlockedNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1DeflectionPlates"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"Device 12V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1Device 3.3V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1Device TemperatureNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1EEPROM Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1Expected IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1Inserted IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1IO Module IO EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1IO Module Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1IO Module Power GoodNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1IO Module PresentNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1Offset"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"PXI_Clk10NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1PXI_StarNumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1PXI_Trig0ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1PXI_Trig1ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1PXI_Trig2ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1PXI_Trig3ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXI_Trig4ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1PXI_Trig5ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1PXI_Trig6ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1PXI_Trig7ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1PXIe_DStarBNumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1PXIe_DStarCArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1PXIe_Sync100NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGATDC Local AssertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1TDC Local DeassertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1TDC Pulse Width ValidNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1TDC Pulse WidthNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1</Property>
			</Item>
			<Item Name="DeflectionPlates" Type="FPGA FIFO">
				<Property Name="Actual Number of Elements" Type="UInt">514</Property>
				<Property Name="Arbitration for Read" Type="UInt">2</Property>
				<Property Name="Arbitration for Write" Type="UInt">2</Property>
				<Property Name="Control Logic" Type="UInt">1</Property>
				<Property Name="Data Type" Type="UInt">0</Property>
				<Property Name="Disable on Overflow/Underflow" Type="Bool">false</Property>
				<Property Name="fifo.configuration" Type="Str">"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"</Property>
				<Property Name="fifo.configured" Type="Bool">true</Property>
				<Property Name="fifo.projectItemValid" Type="Bool">true</Property>
				<Property Name="fifo.valid" Type="Bool">true</Property>
				<Property Name="fifo.version" Type="Int">12</Property>
				<Property Name="FPGA.PersistentID" Type="Str">{4804425F-112E-4382-B1CB-7001FB309597}</Property>
				<Property Name="Local" Type="Bool">false</Property>
				<Property Name="Memory Type" Type="UInt">2</Property>
				<Property Name="Number Of Elements Per Read" Type="UInt">1</Property>
				<Property Name="Number Of Elements Per Write" Type="UInt">1</Property>
				<Property Name="Requested Number of Elements" Type="UInt">1</Property>
				<Property Name="Type" Type="UInt">0</Property>
				<Property Name="Type Descriptor" Type="Str">1000800000000001000A402104426F6F6C00000100000000000000</Property>
			</Item>
			<Item Name="Filter_Calcs.vi" Type="VI" URL="../Filter_Calcs.vi">
				<Property Name="configString.guid" Type="Str">{084B1062-4A20-4FB2-8021-921708DF0C1E}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1{10E1CFBB-1AD5-4216-AF3C-179B50844C2A}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1{11C98952-A059-45B5-8C5E-7AEB67A90482}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{17C3A0B9-BDFB-4B0D-B9E7-825C0B6AF754}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1{2162DAB2-77DD-41C3-AC08-0D65243AF157}"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"{31D8356C-3C5E-4FF5-A22C-206D1324EE7B}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1{3A981A4F-A5FF-406F-AE80-D5B89D36D067}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1{3F7647C3-FE02-4DE4-860F-1A1E62F74CDF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1{4343D6C8-20FF-4333-9B06-A9CC26D85E04}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1{468A03BA-8ADE-43A1-844E-3B36D4E61443}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1{4804425F-112E-4382-B1CB-7001FB309597}"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"{4F7F334C-9740-480D-86E5-4B0D4F943AA3}NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1{61FADCE9-EB30-4590-8F2B-2312EE0D85D4}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1{67D8D00E-0C54-4D49-A90F-4255283C5AB7}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1{697A5EA5-186F-41BF-B601-49B68CB77712}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1{699283BF-E2EC-4E7D-AB61-744A6FB126CD}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1{715EF477-65A6-48C6-8092-446228953984}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1{743C76C8-415E-4A8F-80D5-224E02C1BEE7}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1{78F09531-B3E0-4BA4-809F-47A899AAD328}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1{7EC8CF3F-C472-4DF5-A906-0A078F567EAA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1{80673867-92CD-4ED8-A698-F378E4C4A3BF}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1{82C01DCA-269A-4A48-B601-6B7325590A37}"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"{8852D604-CA5F-4C40-B41D-FA7D9B830968}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1{988936CC-148D-472E-9B03-FC773BDB55B1}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1{9F0368A3-0177-4227-866B-D59CECFF4ACA}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1{A22905E4-B634-47B7-ADC3-D261FA5AAC73}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1{A2E4D33D-97FD-43F3-9A6B-71F0CEA5698E}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1{B0FDB237-63CF-48EC-A428-74ED3534F8C6}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1{C106E6B9-32E3-495D-B286-9A025262EBFF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1{C3B4415D-7601-4C0D-AAE3-8FED78FFCEE8}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1{D10753BC-9423-43A9-948B-9CEF5429D999}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1{D533ED2C-FE14-4E34-809F-580FF97D40DA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA</Property>
				<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;BoxCar"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"Clock100 PLL UnlockedNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1DeflectionPlates"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"Device 12V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1Device 3.3V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1Device TemperatureNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1EEPROM Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1Expected IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1Inserted IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1IO Module IO EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1IO Module Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1IO Module Power GoodNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1IO Module PresentNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1Offset"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"PXI_Clk10NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1PXI_StarNumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1PXI_Trig0ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1PXI_Trig1ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1PXI_Trig2ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1PXI_Trig3ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXI_Trig4ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1PXI_Trig5ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1PXI_Trig6ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1PXI_Trig7ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1PXIe_DStarBNumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1PXIe_DStarCArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1PXIe_Sync100NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGATDC Local AssertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1TDC Local DeassertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1TDC Pulse Width ValidNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1TDC Pulse WidthNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1</Property>
			</Item>
			<Item Name="filter_logic_chargeupdate.vi" Type="VI" URL="../filter_logic_chargeupdate.vi">
				<Property Name="configString.guid" Type="Str">{084B1062-4A20-4FB2-8021-921708DF0C1E}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1{10E1CFBB-1AD5-4216-AF3C-179B50844C2A}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1{11C98952-A059-45B5-8C5E-7AEB67A90482}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{17C3A0B9-BDFB-4B0D-B9E7-825C0B6AF754}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1{2162DAB2-77DD-41C3-AC08-0D65243AF157}"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"{31D8356C-3C5E-4FF5-A22C-206D1324EE7B}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1{3A981A4F-A5FF-406F-AE80-D5B89D36D067}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1{3F7647C3-FE02-4DE4-860F-1A1E62F74CDF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1{4343D6C8-20FF-4333-9B06-A9CC26D85E04}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1{468A03BA-8ADE-43A1-844E-3B36D4E61443}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1{4804425F-112E-4382-B1CB-7001FB309597}"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"{4F7F334C-9740-480D-86E5-4B0D4F943AA3}NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1{61FADCE9-EB30-4590-8F2B-2312EE0D85D4}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1{67D8D00E-0C54-4D49-A90F-4255283C5AB7}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1{697A5EA5-186F-41BF-B601-49B68CB77712}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1{699283BF-E2EC-4E7D-AB61-744A6FB126CD}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1{715EF477-65A6-48C6-8092-446228953984}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1{743C76C8-415E-4A8F-80D5-224E02C1BEE7}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1{78F09531-B3E0-4BA4-809F-47A899AAD328}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1{7EC8CF3F-C472-4DF5-A906-0A078F567EAA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1{80673867-92CD-4ED8-A698-F378E4C4A3BF}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1{82C01DCA-269A-4A48-B601-6B7325590A37}"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"{8852D604-CA5F-4C40-B41D-FA7D9B830968}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1{988936CC-148D-472E-9B03-FC773BDB55B1}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1{9F0368A3-0177-4227-866B-D59CECFF4ACA}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1{A22905E4-B634-47B7-ADC3-D261FA5AAC73}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1{A2E4D33D-97FD-43F3-9A6B-71F0CEA5698E}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1{B0FDB237-63CF-48EC-A428-74ED3534F8C6}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1{C106E6B9-32E3-495D-B286-9A025262EBFF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1{C3B4415D-7601-4C0D-AAE3-8FED78FFCEE8}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1{D10753BC-9423-43A9-948B-9CEF5429D999}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1{D533ED2C-FE14-4E34-809F-580FF97D40DA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA</Property>
				<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;BoxCar"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"Clock100 PLL UnlockedNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1DeflectionPlates"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"Device 12V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1Device 3.3V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1Device TemperatureNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1EEPROM Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1Expected IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1Inserted IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1IO Module IO EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1IO Module Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1IO Module Power GoodNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1IO Module PresentNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1Offset"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"PXI_Clk10NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1PXI_StarNumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1PXI_Trig0ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1PXI_Trig1ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1PXI_Trig2ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1PXI_Trig3ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXI_Trig4ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1PXI_Trig5ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1PXI_Trig6ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1PXI_Trig7ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1PXIe_DStarBNumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1PXIe_DStarCArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1PXIe_Sync100NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGATDC Local AssertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1TDC Local DeassertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1TDC Pulse Width ValidNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1TDC Pulse WidthNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1</Property>
			</Item>
			<Item Name="filter_logic_delays.vi" Type="VI" URL="../filter_logic_delays.vi">
				<Property Name="configString.guid" Type="Str">{084B1062-4A20-4FB2-8021-921708DF0C1E}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1{10E1CFBB-1AD5-4216-AF3C-179B50844C2A}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1{11C98952-A059-45B5-8C5E-7AEB67A90482}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{17C3A0B9-BDFB-4B0D-B9E7-825C0B6AF754}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1{2162DAB2-77DD-41C3-AC08-0D65243AF157}"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"{31D8356C-3C5E-4FF5-A22C-206D1324EE7B}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1{3A981A4F-A5FF-406F-AE80-D5B89D36D067}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1{3F7647C3-FE02-4DE4-860F-1A1E62F74CDF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1{4343D6C8-20FF-4333-9B06-A9CC26D85E04}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1{468A03BA-8ADE-43A1-844E-3B36D4E61443}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1{4804425F-112E-4382-B1CB-7001FB309597}"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"{4F7F334C-9740-480D-86E5-4B0D4F943AA3}NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1{61FADCE9-EB30-4590-8F2B-2312EE0D85D4}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1{67D8D00E-0C54-4D49-A90F-4255283C5AB7}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1{697A5EA5-186F-41BF-B601-49B68CB77712}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1{699283BF-E2EC-4E7D-AB61-744A6FB126CD}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1{715EF477-65A6-48C6-8092-446228953984}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1{743C76C8-415E-4A8F-80D5-224E02C1BEE7}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1{78F09531-B3E0-4BA4-809F-47A899AAD328}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1{7EC8CF3F-C472-4DF5-A906-0A078F567EAA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1{80673867-92CD-4ED8-A698-F378E4C4A3BF}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1{82C01DCA-269A-4A48-B601-6B7325590A37}"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"{8852D604-CA5F-4C40-B41D-FA7D9B830968}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1{988936CC-148D-472E-9B03-FC773BDB55B1}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1{9F0368A3-0177-4227-866B-D59CECFF4ACA}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1{A22905E4-B634-47B7-ADC3-D261FA5AAC73}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1{A2E4D33D-97FD-43F3-9A6B-71F0CEA5698E}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1{B0FDB237-63CF-48EC-A428-74ED3534F8C6}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1{C106E6B9-32E3-495D-B286-9A025262EBFF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1{C3B4415D-7601-4C0D-AAE3-8FED78FFCEE8}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1{D10753BC-9423-43A9-948B-9CEF5429D999}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1{D533ED2C-FE14-4E34-809F-580FF97D40DA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA</Property>
				<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;BoxCar"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"Clock100 PLL UnlockedNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1DeflectionPlates"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"Device 12V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1Device 3.3V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1Device TemperatureNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1EEPROM Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1Expected IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1Inserted IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1IO Module IO EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1IO Module Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1IO Module Power GoodNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1IO Module PresentNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1Offset"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"PXI_Clk10NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1PXI_StarNumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1PXI_Trig0ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1PXI_Trig1ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1PXI_Trig2ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1PXI_Trig3ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXI_Trig4ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1PXI_Trig5ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1PXI_Trig6ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1PXI_Trig7ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1PXIe_DStarBNumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1PXIe_DStarCArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1PXIe_Sync100NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGATDC Local AssertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1TDC Local DeassertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1TDC Pulse Width ValidNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1TDC Pulse WidthNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1</Property>
			</Item>
			<Item Name="FPGA_Code.vi" Type="VI" URL="../FPGA_Code.vi">
				<Property Name="configString.guid" Type="Str">{084B1062-4A20-4FB2-8021-921708DF0C1E}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1{10E1CFBB-1AD5-4216-AF3C-179B50844C2A}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1{11C98952-A059-45B5-8C5E-7AEB67A90482}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{17C3A0B9-BDFB-4B0D-B9E7-825C0B6AF754}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1{2162DAB2-77DD-41C3-AC08-0D65243AF157}"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"{31D8356C-3C5E-4FF5-A22C-206D1324EE7B}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1{3A981A4F-A5FF-406F-AE80-D5B89D36D067}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1{3F7647C3-FE02-4DE4-860F-1A1E62F74CDF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1{4343D6C8-20FF-4333-9B06-A9CC26D85E04}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1{468A03BA-8ADE-43A1-844E-3B36D4E61443}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1{4804425F-112E-4382-B1CB-7001FB309597}"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"{4F7F334C-9740-480D-86E5-4B0D4F943AA3}NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1{61FADCE9-EB30-4590-8F2B-2312EE0D85D4}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1{67D8D00E-0C54-4D49-A90F-4255283C5AB7}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1{697A5EA5-186F-41BF-B601-49B68CB77712}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1{699283BF-E2EC-4E7D-AB61-744A6FB126CD}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1{715EF477-65A6-48C6-8092-446228953984}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1{743C76C8-415E-4A8F-80D5-224E02C1BEE7}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1{78F09531-B3E0-4BA4-809F-47A899AAD328}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1{7EC8CF3F-C472-4DF5-A906-0A078F567EAA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1{80673867-92CD-4ED8-A698-F378E4C4A3BF}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1{82C01DCA-269A-4A48-B601-6B7325590A37}"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"{8852D604-CA5F-4C40-B41D-FA7D9B830968}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1{988936CC-148D-472E-9B03-FC773BDB55B1}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1{9F0368A3-0177-4227-866B-D59CECFF4ACA}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1{A22905E4-B634-47B7-ADC3-D261FA5AAC73}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1{A2E4D33D-97FD-43F3-9A6B-71F0CEA5698E}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1{B0FDB237-63CF-48EC-A428-74ED3534F8C6}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1{C106E6B9-32E3-495D-B286-9A025262EBFF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1{C3B4415D-7601-4C0D-AAE3-8FED78FFCEE8}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1{D10753BC-9423-43A9-948B-9CEF5429D999}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1{D533ED2C-FE14-4E34-809F-580FF97D40DA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA</Property>
				<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;BoxCar"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"Clock100 PLL UnlockedNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1DeflectionPlates"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"Device 12V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1Device 3.3V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1Device TemperatureNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1EEPROM Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1Expected IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1Inserted IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1IO Module IO EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1IO Module Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1IO Module Power GoodNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1IO Module PresentNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1Offset"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"PXI_Clk10NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1PXI_StarNumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1PXI_Trig0ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1PXI_Trig1ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1PXI_Trig2ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1PXI_Trig3ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXI_Trig4ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1PXI_Trig5ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1PXI_Trig6ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1PXI_Trig7ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1PXIe_DStarBNumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1PXIe_DStarCArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1PXIe_Sync100NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGATDC Local AssertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1TDC Local DeassertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1TDC Pulse Width ValidNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1TDC Pulse WidthNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1</Property>
			</Item>
			<Item Name="Initialize_FIFOs.vi" Type="VI" URL="../Initialize_FIFOs.vi">
				<Property Name="configString.guid" Type="Str">{084B1062-4A20-4FB2-8021-921708DF0C1E}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1{10E1CFBB-1AD5-4216-AF3C-179B50844C2A}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1{11C98952-A059-45B5-8C5E-7AEB67A90482}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{17C3A0B9-BDFB-4B0D-B9E7-825C0B6AF754}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1{2162DAB2-77DD-41C3-AC08-0D65243AF157}"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"{31D8356C-3C5E-4FF5-A22C-206D1324EE7B}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1{3A981A4F-A5FF-406F-AE80-D5B89D36D067}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1{3F7647C3-FE02-4DE4-860F-1A1E62F74CDF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1{4343D6C8-20FF-4333-9B06-A9CC26D85E04}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1{468A03BA-8ADE-43A1-844E-3B36D4E61443}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1{4804425F-112E-4382-B1CB-7001FB309597}"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"{4F7F334C-9740-480D-86E5-4B0D4F943AA3}NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1{61FADCE9-EB30-4590-8F2B-2312EE0D85D4}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1{67D8D00E-0C54-4D49-A90F-4255283C5AB7}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1{697A5EA5-186F-41BF-B601-49B68CB77712}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1{699283BF-E2EC-4E7D-AB61-744A6FB126CD}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1{715EF477-65A6-48C6-8092-446228953984}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1{743C76C8-415E-4A8F-80D5-224E02C1BEE7}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1{78F09531-B3E0-4BA4-809F-47A899AAD328}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1{7EC8CF3F-C472-4DF5-A906-0A078F567EAA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1{80673867-92CD-4ED8-A698-F378E4C4A3BF}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1{82C01DCA-269A-4A48-B601-6B7325590A37}"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"{8852D604-CA5F-4C40-B41D-FA7D9B830968}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1{988936CC-148D-472E-9B03-FC773BDB55B1}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1{9F0368A3-0177-4227-866B-D59CECFF4ACA}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1{A22905E4-B634-47B7-ADC3-D261FA5AAC73}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1{A2E4D33D-97FD-43F3-9A6B-71F0CEA5698E}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1{B0FDB237-63CF-48EC-A428-74ED3534F8C6}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1{C106E6B9-32E3-495D-B286-9A025262EBFF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1{C3B4415D-7601-4C0D-AAE3-8FED78FFCEE8}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1{D10753BC-9423-43A9-948B-9CEF5429D999}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1{D533ED2C-FE14-4E34-809F-580FF97D40DA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA</Property>
				<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;BoxCar"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"Clock100 PLL UnlockedNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1DeflectionPlates"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"Device 12V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1Device 3.3V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1Device TemperatureNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1EEPROM Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1Expected IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1Inserted IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1IO Module IO EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1IO Module Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1IO Module Power GoodNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1IO Module PresentNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1Offset"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"PXI_Clk10NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1PXI_StarNumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1PXI_Trig0ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1PXI_Trig1ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1PXI_Trig2ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1PXI_Trig3ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXI_Trig4ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1PXI_Trig5ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1PXI_Trig6ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1PXI_Trig7ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1PXIe_DStarBNumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1PXIe_DStarCArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1PXIe_Sync100NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGATDC Local AssertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1TDC Local DeassertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1TDC Pulse Width ValidNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1TDC Pulse WidthNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1</Property>
			</Item>
			<Item Name="IO Module" Type="FPGA Component Level IP">
				<Property Name="NI.LV.CLIP.DeclarationCategory" Type="Str"></Property>
				<Property Name="NI.LV.CLIP.ExtendedConfigString" Type="Str">IOModuleID:0x109375BC,Version:,National Instruments::NI 5782,SyncClock:CLK10</Property>
				<Property Name="NI.LV.CLIP.SocketedCLIP" Type="Bool">true</Property>
				<Property Name="NI.LV.CLIP.SocketSelection" Type="Str">FlexRIO-K7IOModule</Property>
				<Property Name="NI.LV.CLIP.SocketSpecificCompileSignature" Type="Str">IOModuleID:0x109375BC,Version:,National Instruments::NI 5782,SyncClock:CLK10</Property>
				<Property Name="NI.LV.CLIP.Version" Type="UInt">4</Property>
				<Property Name="NI.LV.FPGA.Valid" Type="Bool">true</Property>
				<Property Name="NI.SortType" Type="Int">3</Property>
			</Item>
			<Item Name="IP Builder" Type="IP Builder Target">
				<Item Name="Dependencies" Type="Dependencies"/>
				<Item Name="Build Specifications" Type="Build"/>
			</Item>
			<Item Name="Offset" Type="FPGA FIFO">
				<Property Name="Actual Number of Elements" Type="UInt">10</Property>
				<Property Name="Arbitration for Read" Type="UInt">2</Property>
				<Property Name="Arbitration for Write" Type="UInt">2</Property>
				<Property Name="Control Logic" Type="UInt">0</Property>
				<Property Name="Data Type" Type="UInt">2</Property>
				<Property Name="Disable on Overflow/Underflow" Type="Bool">false</Property>
				<Property Name="fifo.configuration" Type="Str">"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"</Property>
				<Property Name="fifo.configured" Type="Bool">true</Property>
				<Property Name="fifo.projectItemValid" Type="Bool">true</Property>
				<Property Name="fifo.valid" Type="Bool">true</Property>
				<Property Name="fifo.version" Type="Int">12</Property>
				<Property Name="FPGA.PersistentID" Type="Str">{82C01DCA-269A-4A48-B601-6B7325590A37}</Property>
				<Property Name="Local" Type="Bool">false</Property>
				<Property Name="Memory Type" Type="UInt">0</Property>
				<Property Name="Number Of Elements Per Read" Type="UInt">1</Property>
				<Property Name="Number Of Elements Per Write" Type="UInt">1</Property>
				<Property Name="Requested Number of Elements" Type="UInt">10</Property>
				<Property Name="Type" Type="UInt">0</Property>
				<Property Name="Type Descriptor" Type="Str">100080000000000100094002000349313600010000000000000000</Property>
			</Item>
			<Item Name="Offset.vi" Type="VI" URL="../Offset.vi">
				<Property Name="configString.guid" Type="Str">{084B1062-4A20-4FB2-8021-921708DF0C1E}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1{10E1CFBB-1AD5-4216-AF3C-179B50844C2A}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1{11C98952-A059-45B5-8C5E-7AEB67A90482}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{17C3A0B9-BDFB-4B0D-B9E7-825C0B6AF754}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1{2162DAB2-77DD-41C3-AC08-0D65243AF157}"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"{31D8356C-3C5E-4FF5-A22C-206D1324EE7B}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1{3A981A4F-A5FF-406F-AE80-D5B89D36D067}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1{3F7647C3-FE02-4DE4-860F-1A1E62F74CDF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1{4343D6C8-20FF-4333-9B06-A9CC26D85E04}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1{468A03BA-8ADE-43A1-844E-3B36D4E61443}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1{4804425F-112E-4382-B1CB-7001FB309597}"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"{4F7F334C-9740-480D-86E5-4B0D4F943AA3}NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1{61FADCE9-EB30-4590-8F2B-2312EE0D85D4}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1{67D8D00E-0C54-4D49-A90F-4255283C5AB7}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1{697A5EA5-186F-41BF-B601-49B68CB77712}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1{699283BF-E2EC-4E7D-AB61-744A6FB126CD}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1{715EF477-65A6-48C6-8092-446228953984}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1{743C76C8-415E-4A8F-80D5-224E02C1BEE7}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1{78F09531-B3E0-4BA4-809F-47A899AAD328}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1{7EC8CF3F-C472-4DF5-A906-0A078F567EAA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1{80673867-92CD-4ED8-A698-F378E4C4A3BF}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1{82C01DCA-269A-4A48-B601-6B7325590A37}"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"{8852D604-CA5F-4C40-B41D-FA7D9B830968}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1{988936CC-148D-472E-9B03-FC773BDB55B1}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1{9F0368A3-0177-4227-866B-D59CECFF4ACA}NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1{A22905E4-B634-47B7-ADC3-D261FA5AAC73}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1{A2E4D33D-97FD-43F3-9A6B-71F0CEA5698E}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1{B0FDB237-63CF-48EC-A428-74ED3534F8C6}NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1{C106E6B9-32E3-495D-B286-9A025262EBFF}NumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1{C3B4415D-7601-4C0D-AAE3-8FED78FFCEE8}NumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1{D10753BC-9423-43A9-948B-9CEF5429D999}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1{D533ED2C-FE14-4E34-809F-580FF97D40DA}ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA</Property>
				<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;BoxCar"ControlLogic=0;NumberOfElements=37;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000940030003493332000100000000000000000000;DisableOnOverflowUnderflow=FALSE"Clock100 PLL UnlockedNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Clock100 PLL Unlocked;1DeflectionPlates"ControlLogic=1;NumberOfElements=514;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=2;;DataType=1000800000000001000A402104426F6F6C00000100000000000000;DisableOnOverflowUnderflow=FALSE"Device 12V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 12V Power;1Device 3.3V PowerNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device 3.3V Power;1Device TemperatureNumberOfSyncRegistersForReadInProject=Auto;resource=/Board IO/Device Temperature;1EEPROM Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/EEPROM Power Enabled;1Expected IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Expected IO Module ID;1Inserted IO Module IDNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/Inserted IO Module ID;1IO Module IO EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module IO Enabled;1IO Module Power EnabledNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Enabled;1IO Module Power GoodNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Power Good;1IO Module PresentNumberOfSyncRegistersForReadInProject=Auto;resource=/IO Module Status/IO Module Present;1Offset"ControlLogic=0;NumberOfElements=10;Type=0;ReadArbs=Never Arbitrate;ElementsPerRead=1;WriteArbs=Never Arbitrate;ElementsPerWrite=1;Implementation=0;;DataType=100080000000000100094002000349313600010000000000000000;DisableOnOverflowUnderflow=FALSE"PXI_Clk10NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Clk10;1PXI_StarNumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Star;1PXI_Trig0ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig0;1PXI_Trig1ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig1;1PXI_Trig2ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig2;1PXI_Trig3ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig3;1PXI_Trig4ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig4;1PXI_Trig5ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig5;1PXI_Trig6ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig6;1PXI_Trig7ArbitrationForOutputData=NeverArbitrate;ArbitrationForOutputEnable=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForOutputEnable=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXI/PXI_Trig7;1PXIe_DStarBNumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarB;1PXIe_DStarCArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/PXIe/PXIe_DStarC;1PXIe_Sync100NumberOfSyncRegistersForReadInProject=0;resource=/PXIe/PXIe_Sync100;1PXIe-7971R/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSPXIE_7971RFPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGATDC Local AssertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Assert;1TDC Local DeassertArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Local Deassert;1TDC Pulse Width ValidNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width Valid;1TDC Pulse WidthNumberOfSyncRegistersForReadInProject=Auto;resource=/TDC IO/TDC Pulse Width;1</Property>
			</Item>
			<Item Name="Dependencies" Type="Dependencies"/>
			<Item Name="Build Specifications" Type="Build"/>
		</Item>
		<Item Name="Network Shared Variables.lvlib" Type="Library" URL="../../../Global Variables/Network Shared Variables.lvlib"/>
		<Item Name="process_limits.vi" Type="VI" URL="../process_limits.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="NI_Matrix.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/Matrix/NI_Matrix.lvlib"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
