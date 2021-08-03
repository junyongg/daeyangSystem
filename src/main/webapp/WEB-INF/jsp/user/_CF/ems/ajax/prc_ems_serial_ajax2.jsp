<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
      <h1>PCS</h1>
      <table  class="tbl_verti1">
      	<tr>
      		<th>AC Input Voltage</th>
      		<td>${resultList.inputVoltageR }</td>
      		
      		<th>Solar Input Voltage</th>
      		<td>${resultList.solarInputVoltage1 }</td>
      	</tr>
      	<tr>
      		<th>AC Input Frequency</th>
      		<td>${resultList.inputFrequency }</td>
      		
      		<th>Battery Voltage</th>
      		<td>${resultList.batteryVoltage}</td>
      	</tr>
      	<tr>
      		<th>AC Output Voltage</th>
      		<td>${resultList.outputVoltageR}</td>
      		
      		<th>Battery Current</th>
      		<td>${resultList.batteryCurrent}</td>
      	</tr>
      	<tr>
      		<th>AC Output active power</th>
      		<td>${resultList.outputActivePowerR}</td>
      		
      		<th>Battery Capacity</th>
      		<td>${resultList.batteryCapacity}</td>
      	</tr>
      	<tr>
      		<th>AC Output frequency</th>
      		<td>${resultList.outputFrequency}</td>
      		
      		<th>Battery Power</th>
      		<td>${resultList.batteryPower}</td>
      	</tr>
      	<tr>
      		<th>AC Output apparent Power</th>
      		<td>${resultList.outputApparentPowerR}</td>
      		
      		<th>Inner Temp</th>
      		<td>${resultList.innerTemp}</td>
      	</tr>
      	<tr>
      		<th>Status</th>
      		<td>${resultList.workingStatus}</td>
      		
      		<th>Component max Temperature</th>
      		<td>${resultList.componentMaxTemp}</td>
      	</tr>
      	<tr>
      		<th>Working mode</th>
      		<td>${resultList.workingMode}</td>
      		
      		<th>Fault</th>
      		<td>${resultList.faultCodeIdStoredInFlash}</td>
      	</tr>
      </table>
      
      
      