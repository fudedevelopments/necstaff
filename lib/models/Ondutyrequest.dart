/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Ondutyrequest type in your schema. */
class Ondutyrequest extends amplify_core.Model {
  static const classType = const _OndutyrequestModelType();
  final String id;
  final String? _ondutyname;
  final String? _description;
  final String? _date;
  final String? _location;
  final String? _registerUrl;
  final List<String>? _documets;
  final Status? _proctorApproval;
  final String? _proctorComments;
  final Status? _acApproval;
  final String? _acComments;
  final Status? _hodApproval;
  final String? _hodComments;
  final Student? _student;
  final ClassRoom? _classRoom;
  final Proctor? _proctor;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  OndutyrequestModelIdentifier get modelIdentifier {
      return OndutyrequestModelIdentifier(
        id: id
      );
  }
  
  String? get ondutyname {
    return _ondutyname;
  }
  
  String? get description {
    return _description;
  }
  
  String? get date {
    return _date;
  }
  
  String? get location {
    return _location;
  }
  
  String? get registerUrl {
    return _registerUrl;
  }
  
  List<String>? get documets {
    return _documets;
  }
  
  Status? get proctorApproval {
    return _proctorApproval;
  }
  
  String? get proctorComments {
    return _proctorComments;
  }
  
  Status? get acApproval {
    return _acApproval;
  }
  
  String? get acComments {
    return _acComments;
  }
  
  Status? get hodApproval {
    return _hodApproval;
  }
  
  String? get hodComments {
    return _hodComments;
  }
  
  Student? get student {
    return _student;
  }
  
  ClassRoom? get classRoom {
    return _classRoom;
  }
  
  Proctor? get proctor {
    return _proctor;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Ondutyrequest._internal({required this.id, ondutyname, description, date, location, registerUrl, documets, proctorApproval, proctorComments, acApproval, acComments, hodApproval, hodComments, student, classRoom, proctor, createdAt, updatedAt}): _ondutyname = ondutyname, _description = description, _date = date, _location = location, _registerUrl = registerUrl, _documets = documets, _proctorApproval = proctorApproval, _proctorComments = proctorComments, _acApproval = acApproval, _acComments = acComments, _hodApproval = hodApproval, _hodComments = hodComments, _student = student, _classRoom = classRoom, _proctor = proctor, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Ondutyrequest({String? id, String? ondutyname, String? description, String? date, String? location, String? registerUrl, List<String>? documets, Status? proctorApproval, String? proctorComments, Status? acApproval, String? acComments, Status? hodApproval, String? hodComments, Student? student, ClassRoom? classRoom, Proctor? proctor}) {
    return Ondutyrequest._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      ondutyname: ondutyname,
      description: description,
      date: date,
      location: location,
      registerUrl: registerUrl,
      documets: documets != null ? List<String>.unmodifiable(documets) : documets,
      proctorApproval: proctorApproval,
      proctorComments: proctorComments,
      acApproval: acApproval,
      acComments: acComments,
      hodApproval: hodApproval,
      hodComments: hodComments,
      student: student,
      classRoom: classRoom,
      proctor: proctor);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Ondutyrequest &&
      id == other.id &&
      _ondutyname == other._ondutyname &&
      _description == other._description &&
      _date == other._date &&
      _location == other._location &&
      _registerUrl == other._registerUrl &&
      DeepCollectionEquality().equals(_documets, other._documets) &&
      _proctorApproval == other._proctorApproval &&
      _proctorComments == other._proctorComments &&
      _acApproval == other._acApproval &&
      _acComments == other._acComments &&
      _hodApproval == other._hodApproval &&
      _hodComments == other._hodComments &&
      _student == other._student &&
      _classRoom == other._classRoom &&
      _proctor == other._proctor;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Ondutyrequest {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("ondutyname=" + "$_ondutyname" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("registerUrl=" + "$_registerUrl" + ", ");
    buffer.write("documets=" + (_documets != null ? _documets!.toString() : "null") + ", ");
    buffer.write("proctorApproval=" + (_proctorApproval != null ? amplify_core.enumToString(_proctorApproval)! : "null") + ", ");
    buffer.write("proctorComments=" + "$_proctorComments" + ", ");
    buffer.write("acApproval=" + (_acApproval != null ? amplify_core.enumToString(_acApproval)! : "null") + ", ");
    buffer.write("acComments=" + "$_acComments" + ", ");
    buffer.write("hodApproval=" + (_hodApproval != null ? amplify_core.enumToString(_hodApproval)! : "null") + ", ");
    buffer.write("hodComments=" + "$_hodComments" + ", ");
    buffer.write("student=" + (_student != null ? _student!.toString() : "null") + ", ");
    buffer.write("classRoom=" + (_classRoom != null ? _classRoom!.toString() : "null") + ", ");
    buffer.write("proctor=" + (_proctor != null ? _proctor!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Ondutyrequest copyWith({String? ondutyname, String? description, String? date, String? location, String? registerUrl, List<String>? documets, Status? proctorApproval, String? proctorComments, Status? acApproval, String? acComments, Status? hodApproval, String? hodComments, Student? student, ClassRoom? classRoom, Proctor? proctor}) {
    return Ondutyrequest._internal(
      id: id,
      ondutyname: ondutyname ?? this.ondutyname,
      description: description ?? this.description,
      date: date ?? this.date,
      location: location ?? this.location,
      registerUrl: registerUrl ?? this.registerUrl,
      documets: documets ?? this.documets,
      proctorApproval: proctorApproval ?? this.proctorApproval,
      proctorComments: proctorComments ?? this.proctorComments,
      acApproval: acApproval ?? this.acApproval,
      acComments: acComments ?? this.acComments,
      hodApproval: hodApproval ?? this.hodApproval,
      hodComments: hodComments ?? this.hodComments,
      student: student ?? this.student,
      classRoom: classRoom ?? this.classRoom,
      proctor: proctor ?? this.proctor);
  }
  
  Ondutyrequest copyWithModelFieldValues({
    ModelFieldValue<String?>? ondutyname,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? date,
    ModelFieldValue<String?>? location,
    ModelFieldValue<String?>? registerUrl,
    ModelFieldValue<List<String>?>? documets,
    ModelFieldValue<Status?>? proctorApproval,
    ModelFieldValue<String?>? proctorComments,
    ModelFieldValue<Status?>? acApproval,
    ModelFieldValue<String?>? acComments,
    ModelFieldValue<Status?>? hodApproval,
    ModelFieldValue<String?>? hodComments,
    ModelFieldValue<Student?>? student,
    ModelFieldValue<ClassRoom?>? classRoom,
    ModelFieldValue<Proctor?>? proctor
  }) {
    return Ondutyrequest._internal(
      id: id,
      ondutyname: ondutyname == null ? this.ondutyname : ondutyname.value,
      description: description == null ? this.description : description.value,
      date: date == null ? this.date : date.value,
      location: location == null ? this.location : location.value,
      registerUrl: registerUrl == null ? this.registerUrl : registerUrl.value,
      documets: documets == null ? this.documets : documets.value,
      proctorApproval: proctorApproval == null ? this.proctorApproval : proctorApproval.value,
      proctorComments: proctorComments == null ? this.proctorComments : proctorComments.value,
      acApproval: acApproval == null ? this.acApproval : acApproval.value,
      acComments: acComments == null ? this.acComments : acComments.value,
      hodApproval: hodApproval == null ? this.hodApproval : hodApproval.value,
      hodComments: hodComments == null ? this.hodComments : hodComments.value,
      student: student == null ? this.student : student.value,
      classRoom: classRoom == null ? this.classRoom : classRoom.value,
      proctor: proctor == null ? this.proctor : proctor.value
    );
  }
  
  Ondutyrequest.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _ondutyname = json['ondutyname'],
      _description = json['description'],
      _date = json['date'],
      _location = json['location'],
      _registerUrl = json['registerUrl'],
      _documets = json['documets']?.cast<String>(),
      _proctorApproval = amplify_core.enumFromString<Status>(json['proctorApproval'], Status.values),
      _proctorComments = json['proctorComments'],
      _acApproval = amplify_core.enumFromString<Status>(json['acApproval'], Status.values),
      _acComments = json['acComments'],
      _hodApproval = amplify_core.enumFromString<Status>(json['hodApproval'], Status.values),
      _hodComments = json['hodComments'],
      _student = json['student'] != null
        ? json['student']['serializedData'] != null
          ? Student.fromJson(new Map<String, dynamic>.from(json['student']['serializedData']))
          : Student.fromJson(new Map<String, dynamic>.from(json['student']))
        : null,
      _classRoom = json['classRoom'] != null
        ? json['classRoom']['serializedData'] != null
          ? ClassRoom.fromJson(new Map<String, dynamic>.from(json['classRoom']['serializedData']))
          : ClassRoom.fromJson(new Map<String, dynamic>.from(json['classRoom']))
        : null,
      _proctor = json['proctor'] != null
        ? json['proctor']['serializedData'] != null
          ? Proctor.fromJson(new Map<String, dynamic>.from(json['proctor']['serializedData']))
          : Proctor.fromJson(new Map<String, dynamic>.from(json['proctor']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'ondutyname': _ondutyname, 'description': _description, 'date': _date, 'location': _location, 'registerUrl': _registerUrl, 'documets': _documets, 'proctorApproval': amplify_core.enumToString(_proctorApproval), 'proctorComments': _proctorComments, 'acApproval': amplify_core.enumToString(_acApproval), 'acComments': _acComments, 'hodApproval': amplify_core.enumToString(_hodApproval), 'hodComments': _hodComments, 'student': _student?.toJson(), 'classRoom': _classRoom?.toJson(), 'proctor': _proctor?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'ondutyname': _ondutyname,
    'description': _description,
    'date': _date,
    'location': _location,
    'registerUrl': _registerUrl,
    'documets': _documets,
    'proctorApproval': _proctorApproval,
    'proctorComments': _proctorComments,
    'acApproval': _acApproval,
    'acComments': _acComments,
    'hodApproval': _hodApproval,
    'hodComments': _hodComments,
    'student': _student,
    'classRoom': _classRoom,
    'proctor': _proctor,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<OndutyrequestModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<OndutyrequestModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ONDUTYNAME = amplify_core.QueryField(fieldName: "ondutyname");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final LOCATION = amplify_core.QueryField(fieldName: "location");
  static final REGISTERURL = amplify_core.QueryField(fieldName: "registerUrl");
  static final DOCUMETS = amplify_core.QueryField(fieldName: "documets");
  static final PROCTORAPPROVAL = amplify_core.QueryField(fieldName: "proctorApproval");
  static final PROCTORCOMMENTS = amplify_core.QueryField(fieldName: "proctorComments");
  static final ACAPPROVAL = amplify_core.QueryField(fieldName: "acApproval");
  static final ACCOMMENTS = amplify_core.QueryField(fieldName: "acComments");
  static final HODAPPROVAL = amplify_core.QueryField(fieldName: "hodApproval");
  static final HODCOMMENTS = amplify_core.QueryField(fieldName: "hodComments");
  static final STUDENT = amplify_core.QueryField(
    fieldName: "student",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Student'));
  static final CLASSROOM = amplify_core.QueryField(
    fieldName: "classRoom",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'ClassRoom'));
  static final PROCTOR = amplify_core.QueryField(
    fieldName: "proctor",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Proctor'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Ondutyrequest";
    modelSchemaDefinition.pluralName = "Ondutyrequests";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "ADMINS", "STAFF", "STUDENTS" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ondutyrequest.ONDUTYNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ondutyrequest.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ondutyrequest.DATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ondutyrequest.LOCATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ondutyrequest.REGISTERURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ondutyrequest.DOCUMETS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ondutyrequest.PROCTORAPPROVAL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ondutyrequest.PROCTORCOMMENTS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ondutyrequest.ACAPPROVAL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ondutyrequest.ACCOMMENTS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ondutyrequest.HODAPPROVAL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ondutyrequest.HODCOMMENTS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Ondutyrequest.STUDENT,
      isRequired: false,
      targetNames: ['studentid'],
      ofModelName: 'Student'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Ondutyrequest.CLASSROOM,
      isRequired: false,
      targetNames: ['classRoomid'],
      ofModelName: 'ClassRoom'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Ondutyrequest.PROCTOR,
      isRequired: false,
      targetNames: ['proctorid'],
      ofModelName: 'Proctor'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _OndutyrequestModelType extends amplify_core.ModelType<Ondutyrequest> {
  const _OndutyrequestModelType();
  
  @override
  Ondutyrequest fromJson(Map<String, dynamic> jsonData) {
    return Ondutyrequest.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Ondutyrequest';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Ondutyrequest] in your schema.
 */
class OndutyrequestModelIdentifier implements amplify_core.ModelIdentifier<Ondutyrequest> {
  final String id;

  /** Create an instance of OndutyrequestModelIdentifier using [id] the primary key. */
  const OndutyrequestModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'OndutyrequestModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is OndutyrequestModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}