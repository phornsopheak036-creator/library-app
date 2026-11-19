import 'package:flutter/material.dart';
import 'package:num_library/core/utils/validators.dart';
import 'package:num_library/data/mock/mock_data.dart';
import 'package:num_library/shared/widgets/app_text_field.dart';
import 'package:num_library/shared/widgets/primary_button.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _author = TextEditingController();
  final _isbn = TextEditingController();
  final _copies = TextEditingController(text: '1');
  String _category = 'History';

  @override
  void dispose() {
    for (final c in [_title, _author, _isbn, _copies]) {
      c.dispose();
    }
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('"${_title.text}" added')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Book', style: TextStyle(fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(label: 'Book Title', hint: 'Enter book title', icon: Icons.book_outlined,
                  controller: _title, validator: (v) => Validators.required(v, 'Title')),
              const SizedBox(height: 14),
              AppTextField(label: 'Author', hint: 'Enter author name', icon: Icons.person_outline,
                  controller: _author, validator: (v) => Validators.required(v, 'Author')),
              const SizedBox(height: 14),
              const Text('Category', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                value: _category,
                items: [
                  for (final c in MockData.categories.skip(1)) DropdownMenuItem(value: c, child: Text(c)),
                ],
                onChanged: (v) => setState(() => _category = v!),
                decoration: const InputDecoration(border: OutlineInputBorder(), filled: true, fillColor: Colors.white),
              ),
              const SizedBox(height: 14),
              AppTextField(label: 'ISBN', hint: '978-...', icon: Icons.qr_code, controller: _isbn),
              const SizedBox(height: 14),
              AppTextField(label: 'Copies', hint: '1', icon: Icons.copy, controller: _copies,
                  keyboardType: TextInputType.number, validator: (v) => Validators.required(v, 'Copies')),
              const SizedBox(height: 26),
              PrimaryButton(text: 'Add to Library', icon: Icons.check, onPressed: _save),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
