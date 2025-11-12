import 'package:flutter/material.dart';
import 'package:mycleats/widgets/left_drawer.dart';

class CleatsFormPage extends StatefulWidget {
  const CleatsFormPage({super.key});

  @override
  State<CleatsFormPage> createState() => _CleatsFormPageState();
}

class _CleatsFormPageState extends State<CleatsFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();

  String? _selectedCategory = 'MG';
  bool _isFeatured = false;

  final List<DropdownMenuItem<String>> _categoryOptions = const [
    DropdownMenuItem(value: 'FG', child: Text('Firm Ground')),
    DropdownMenuItem(value: 'AG', child: Text('Artificial Grass')),
    DropdownMenuItem(value: 'MG', child: Text('Multi Ground')),
    DropdownMenuItem(value: 'turf', child: Text('Turf')),
    DropdownMenuItem(value: 'indoor', child: Text('Indoor')),
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final cleatData = {
        "name": _nameController.text,
        "brand": _brandController.text,
        "size": int.tryParse(_sizeController.text) ?? 0,
        "price": int.tryParse(_priceController.text) ?? 0,
        "stock": int.tryParse(_stockController.text) ?? 0,
        "description": _descriptionController.text,
        "thumbnail": _thumbnailController.text,
        "category": _selectedCategory,
        "is_featured": _isFeatured,
      };

      // TODO: integrate with backend (e.g., Django API endpoint)
      print("Cleat data: $cleatData");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product saved successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Product')),
        backgroundColor: Colors.green,
        foregroundColor: Colors.purple,
      ),
      drawer: LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter cleat name' : null,
              ),
              TextFormField(
                controller: _brandController,
                decoration: const InputDecoration(labelText: 'Brand'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter brand' : null,
              ),
              TextFormField(
                controller: _sizeController,
                decoration: const InputDecoration(labelText: 'Size'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter size' : null,
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter price' : null,
              ),
              TextFormField(
                controller: _stockController,
                decoration: const InputDecoration(labelText: 'Stock'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter stock' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter description' : null,
              ),
              TextFormField(
                controller: _thumbnailController,
                decoration: const InputDecoration(labelText: 'Thumbnail URL'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter image URL' : null,
              ),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(labelText: 'Category'),
                items: _categoryOptions,
                onChanged: (value) => setState(() => _selectedCategory = value),
              ),
              SwitchListTile(
                title: const Text('Featured'),
                value: _isFeatured,
                onChanged: (value) => setState(() => _isFeatured = value),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Save Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
