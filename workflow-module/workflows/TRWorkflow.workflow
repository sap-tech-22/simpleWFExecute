{
	"contents": {
		"ce3e1b60-471b-40d3-856b-1ea76748d8af": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "com.wftrexecute.trworkflow",
			"subject": "TRWorkflow",
			"name": "TRWorkflow",
			"documentation": "Transfer Request Workflow",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"3e3b1a1a-b90a-4335-83d5-d512fa18a342": {
					"name": "User Decision"
				},
				"6ed09afe-fd68-4eb5-8e7b-a109df5f7799": {
					"name": "Approve"
				},
				"0879f9c3-5523-44b8-9100-74935cdd63bb": {
					"name": "Reject"
				},
				"3afae791-f2a5-41c2-80e3-07324e32bf3c": {
					"name": "ExclusiveGateway1"
				},
				"b7d3e992-3987-4942-bd87-760dbd8526d6": {
					"name": "ServiceTask1"
				}
			},
			"sequenceFlows": {
				"9acd486f-22bb-43d2-96b1-bd808028437d": {
					"name": "SequenceFlow2"
				},
				"12180d7c-d4ad-4764-86dd-763a67d0cc14": {
					"name": "SequenceFlow4"
				},
				"8d967299-39dd-443e-9cd4-f5f61f19acf3": {
					"name": "Approve"
				},
				"61db30c4-77d9-4f4e-848b-19cc42e5c721": {
					"name": "Reject"
				},
				"e8852ae0-488c-44b1-a34e-80477e75123c": {
					"name": "SequenceFlow7"
				},
				"d5af1df0-8a93-43d8-9c60-39fcae1dda8f": {
					"name": "SequenceFlow9"
				},
				"74e4dcde-8204-4725-852c-ea14382af8b7": {
					"name": "SequenceFlow10"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"3e3b1a1a-b90a-4335-83d5-d512fa18a342": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Transfer Request",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "anupam.sap2020@gmail.com",
			"formReference": "/forms/TRWorkflow/actionForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "actionform"
			}, {
				"key": "formRevision",
				"value": "v1"
			}],
			"id": "usertask1",
			"name": "User Decision"
		},
		"6ed09afe-fd68-4eb5-8e7b-a109df5f7799": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/TRWorkflow/approve.js",
			"id": "scripttask1",
			"name": "Approve"
		},
		"0879f9c3-5523-44b8-9100-74935cdd63bb": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/TRWorkflow/reject.js",
			"id": "scripttask2",
			"name": "Reject"
		},
		"3afae791-f2a5-41c2-80e3-07324e32bf3c": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "ExclusiveGateway1",
			"default": "61db30c4-77d9-4f4e-848b-19cc42e5c721"
		},
		"b7d3e992-3987-4942-bd87-760dbd8526d6": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "wfTR_process",
			"path": "/wfpost",
			"httpMethod": "POST",
			"requestVariable": "${context.data}",
			"id": "servicetask1",
			"name": "ServiceTask1"
		},
		"9acd486f-22bb-43d2-96b1-bd808028437d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "3e3b1a1a-b90a-4335-83d5-d512fa18a342"
		},
		"12180d7c-d4ad-4764-86dd-763a67d0cc14": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "3e3b1a1a-b90a-4335-83d5-d512fa18a342",
			"targetRef": "3afae791-f2a5-41c2-80e3-07324e32bf3c"
		},
		"8d967299-39dd-443e-9cd4-f5f61f19acf3": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision==\"approve\"}",
			"id": "sequenceflow5",
			"name": "Approve",
			"sourceRef": "3afae791-f2a5-41c2-80e3-07324e32bf3c",
			"targetRef": "6ed09afe-fd68-4eb5-8e7b-a109df5f7799"
		},
		"61db30c4-77d9-4f4e-848b-19cc42e5c721": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "Reject",
			"sourceRef": "3afae791-f2a5-41c2-80e3-07324e32bf3c",
			"targetRef": "0879f9c3-5523-44b8-9100-74935cdd63bb"
		},
		"e8852ae0-488c-44b1-a34e-80477e75123c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "6ed09afe-fd68-4eb5-8e7b-a109df5f7799",
			"targetRef": "b7d3e992-3987-4942-bd87-760dbd8526d6"
		},
		"d5af1df0-8a93-43d8-9c60-39fcae1dda8f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "SequenceFlow9",
			"sourceRef": "b7d3e992-3987-4942-bd87-760dbd8526d6",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"bc9de760-7c94-46e0-8064-053c1dd97706": {},
				"81f2fd64-d38e-4abe-b7e5-9f401fd826ee": {},
				"27149bf6-c670-42d0-a296-4d791aa13955": {},
				"a636c128-16a3-4d8e-90d9-a0514e08cf86": {},
				"845f31db-f19d-4ec4-a41b-4bad0dfb3a9e": {},
				"5cab8510-e146-4582-820f-e4ecffa87641": {},
				"688b6387-56a2-4990-8413-07a312252e93": {},
				"1653afbc-e1d9-4356-b4c9-3bfcbbb2be76": {},
				"9c635d30-92cb-4cdd-911d-10856f2a9533": {},
				"ade3f908-2a73-449a-9434-6a1ac28aee0a": {},
				"e085e7e0-8923-4fcb-b3bf-550338fce48e": {},
				"bf484ba5-d30d-49fe-abee-b656c7964e11": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 45,
			"y": 100,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 643,
			"y": 96,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"bc9de760-7c94-46e0-8064-053c1dd97706": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 116,
			"y": 88,
			"width": 100,
			"height": 60,
			"object": "3e3b1a1a-b90a-4335-83d5-d512fa18a342"
		},
		"81f2fd64-d38e-4abe-b7e5-9f401fd826ee": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "61,116 123,116",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "bc9de760-7c94-46e0-8064-053c1dd97706",
			"object": "9acd486f-22bb-43d2-96b1-bd808028437d"
		},
		"27149bf6-c670-42d0-a296-4d791aa13955": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 310,
			"y": 19,
			"width": 100,
			"height": 60,
			"object": "6ed09afe-fd68-4eb5-8e7b-a109df5f7799"
		},
		"a636c128-16a3-4d8e-90d9-a0514e08cf86": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 310,
			"y": 148,
			"width": 100,
			"height": 60,
			"object": "0879f9c3-5523-44b8-9100-74935cdd63bb"
		},
		"845f31db-f19d-4ec4-a41b-4bad0dfb3a9e": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 240,
			"y": 96,
			"object": "3afae791-f2a5-41c2-80e3-07324e32bf3c"
		},
		"5cab8510-e146-4582-820f-e4ecffa87641": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "166,117.5 261,117.5",
			"sourceSymbol": "bc9de760-7c94-46e0-8064-053c1dd97706",
			"targetSymbol": "845f31db-f19d-4ec4-a41b-4bad0dfb3a9e",
			"object": "12180d7c-d4ad-4764-86dd-763a67d0cc14"
		},
		"688b6387-56a2-4990-8413-07a312252e93": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "261,117 296,117 296,50 333,50",
			"sourceSymbol": "845f31db-f19d-4ec4-a41b-4bad0dfb3a9e",
			"targetSymbol": "27149bf6-c670-42d0-a296-4d791aa13955",
			"object": "8d967299-39dd-443e-9cd4-f5f61f19acf3"
		},
		"1653afbc-e1d9-4356-b4c9-3bfcbbb2be76": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "261,117 296,117 296,174 328,174",
			"sourceSymbol": "845f31db-f19d-4ec4-a41b-4bad0dfb3a9e",
			"targetSymbol": "a636c128-16a3-4d8e-90d9-a0514e08cf86",
			"object": "61db30c4-77d9-4f4e-848b-19cc42e5c721"
		},
		"9c635d30-92cb-4cdd-911d-10856f2a9533": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 475,
			"y": 88,
			"width": 100,
			"height": 60,
			"object": "b7d3e992-3987-4942-bd87-760dbd8526d6"
		},
		"ade3f908-2a73-449a-9434-6a1ac28aee0a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "360,49 442.75,49 442.75,118 515,118",
			"sourceSymbol": "27149bf6-c670-42d0-a296-4d791aa13955",
			"targetSymbol": "9c635d30-92cb-4cdd-911d-10856f2a9533",
			"object": "e8852ae0-488c-44b1-a34e-80477e75123c"
		},
		"e085e7e0-8923-4fcb-b3bf-550338fce48e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "525,115.75 660.5,115.75",
			"sourceSymbol": "9c635d30-92cb-4cdd-911d-10856f2a9533",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "d5af1df0-8a93-43d8-9c60-39fcae1dda8f"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 10,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 1,
			"scripttask": 2,
			"exclusivegateway": 1
		},
		"74e4dcde-8204-4725-852c-ea14382af8b7": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "SequenceFlow10",
			"sourceRef": "0879f9c3-5523-44b8-9100-74935cdd63bb",
			"targetRef": "b7d3e992-3987-4942-bd87-760dbd8526d6"
		},
		"bf484ba5-d30d-49fe-abee-b656c7964e11": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "360,178 442.75,178 442.75,118 475.5,118",
			"sourceSymbol": "a636c128-16a3-4d8e-90d9-a0514e08cf86",
			"targetSymbol": "9c635d30-92cb-4cdd-911d-10856f2a9533",
			"object": "74e4dcde-8204-4725-852c-ea14382af8b7"
		}
	}
}