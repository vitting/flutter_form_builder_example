import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/models/form_api_model/form_api_item_additional_properties_model.dart';
import 'package:flutter_form_builder_example/models/form_api_model/form_api_item_model.dart';
import 'package:flutter_form_builder_example/models/form_api_model/form_api_model.dart';

FormApiModel formApiExample = FormApiModel(
  id: 'af75ef52-7ff0-4423-85c3-21e7fa824023',
  name: 'FormApi Example',
  fields: [
    FormApiItemModel(
      id: '80d04cf4-1ab7-42c9-8213-baf8f1620df7',
      controlType: ControlTypesEnum.heading,
      additionalProperties: FormApiItemAdditionalPropertiesModel(label: 'Heading 1'),
    ),
    FormApiItemModel(id: 'db0c951c-26c7-4a60-abfb-d64215cb3c30', controlType: ControlTypesEnum.textField),
    FormApiItemModel(id: '03219d56-9be5-4838-b9cc-7415e80360e9', controlType: ControlTypesEnum.numberField),
    FormApiItemModel(id: 'c4b087c6-2673-4fb1-9a68-790cbd0c432b', controlType: ControlTypesEnum.checkbox),
    FormApiItemModel(
      id: 'c6361353-836a-4081-8579-08fca1369e5b',
      controlType: ControlTypesEnum.columns,
      additionalProperties: FormApiItemAdditionalPropertiesModel(
        columns: {
          'column1': [
            FormApiItemModel(
              id: 'b66a2370-a583-4165-90fe-1040edd9f0fe',
              controlType: ControlTypesEnum.textField,
              parentContainerId: 'c6361353-836a-4081-8579-08fca1369e5b',
              columnId: 'column1',
              columnIndex: 1,
            ),
            FormApiItemModel(
              id: '85370b30-00ce-4c2e-912c-659f2501eb20',
              controlType: ControlTypesEnum.heading,
              parentContainerId: 'c6361353-836a-4081-8579-08fca1369e5b',
              columnId: 'column1',
              columnIndex: 1,
              additionalProperties: FormApiItemAdditionalPropertiesModel(label: 'Heading 2'),
            ),
            FormApiItemModel(
              id: '5672d1b4-2039-4e6b-8c56-61a67672d917',
              controlType: ControlTypesEnum.checkbox,
              parentContainerId: 'c6361353-836a-4081-8579-08fca1369e5b',
              columnId: 'column1',
              columnIndex: 1,
            ),
            FormApiItemModel(
              id: 'baec00c1-e6e6-4e46-8f35-a0ea70a04731',
              controlType: ControlTypesEnum.numberField,
              parentContainerId: 'c6361353-836a-4081-8579-08fca1369e5b',
              columnId: 'column1',
              columnIndex: 1,
            ),
          ],
          'column2': [
            FormApiItemModel(
              id: '40fe7fd5-f7db-41b4-9a6f-31190f5bea7e',
              controlType: ControlTypesEnum.checkbox,
              parentContainerId: 'c6361353-836a-4081-8579-08fca1369e5b',
              columnId: 'column1',
              columnIndex: 1,
            ),
            FormApiItemModel(
              id: 'e4c1a500-0cda-4f04-acd6-85419b84d37e',
              controlType: ControlTypesEnum.numberField,
              parentContainerId: 'c6361353-836a-4081-8579-08fca1369e5b',
              columnId: 'column2',
              columnIndex: 2,
            ),
            FormApiItemModel(
              id: 'f5f16b68-942d-44df-938c-2df3a3ea9477',
              controlType: ControlTypesEnum.numberField,
              parentContainerId: 'c6361353-836a-4081-8579-08fca1369e5b',
              columnId: 'column1',
              columnIndex: 1,
            ),
            FormApiItemModel(
              id: '77d4b8ab-6e7c-44fb-b828-812676ccd5db',
              controlType: ControlTypesEnum.heading,
              parentContainerId: 'c6361353-836a-4081-8579-08fca1369e5b',
              columnId: 'column1',
              columnIndex: 1,
              additionalProperties: FormApiItemAdditionalPropertiesModel(label: 'Heading 3'),
            ),
          ],
        },
      ),
    ),
  ],
);
