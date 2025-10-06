// ...existing code...
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kalinq/components/custom_field_with_name.dart';
import 'package:kalinq/utils/theme.dart';

class CreateCampaign extends StatefulWidget {
  const CreateCampaign({super.key});

  @override
  State<CreateCampaign> createState() => _CreateCampaignState();
}

class _CreateCampaignState extends State<CreateCampaign> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _reelsController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();

  String _type = 'Creators';
  final List<String> _types = ['Creators', 'Brands', 'Agencies', 'Others'];

  bool _isPrivate = true;

  RangeValues _budget = const RangeValues(2000, 5000);

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _reelsController.dispose();
    _tagsController.dispose();
    _deadlineController.dispose();
    super.dispose();
  }

  Future<void> _pickDeadline() async {
    DateTime now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      _deadlineController.text =
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final data = {
      'visibility': _isPrivate ? 'Private' : 'Public',
      'type': _type,
      'title': _titleController.text.trim(),
      'description': _descriptionController.text.trim(),
      'no_of_reels': int.tryParse(_reelsController.text.trim()) ?? 0,
      'tags': _tagsController.text.trim().isEmpty
          ? []
          : _tagsController.text.split(',').map((s) => s.trim()).toList(),
      'deadline': _deadlineController.text.trim(),
      'budget_min': _budget.start.toInt(),
      'budget_max': _budget.end.toInt(),
    };

    // Print JSON to console
    print(jsonEncode(data));
    Get.toNamed('/create-campaign/select-creator', arguments: data);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Form submitted — check console for JSON')),
    );
  }

  Widget _buildVisibilityToggle() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _isPrivate = true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _isPrivate ? themeColor : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Private',
                  style: TextStyle(
                    color: _isPrivate ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _isPrivate = false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !_isPrivate ? themeColor : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Public',
                  style: TextStyle(
                    color: !_isPrivate ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color(0XFFFCFCFC),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              decoration: BoxDecoration(
                color: jyellowLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.arrow_back_ios, color: themeColor),
            ),
          ),
        ),
        title: const Text(
          'Add Campaign',
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/magic.svg'),
            onPressed: () {},
          ),
          SizedBox(width: 18),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              _buildVisibilityToggle(),
              const SizedBox(height: 10),
              Form(
                autovalidateMode: AutovalidateMode.onUnfocus,
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Category",
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _type,
                      decoration: InputDecoration(
                        // labelText: 'Type',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,

                        filled: true,
                        fillColor: Colors.grey.shade100,
                      ),
                      items: _types
                          .map(
                            (t) => DropdownMenuItem(value: t, child: Text(t)),
                          )
                          .toList(),
                      onChanged: (v) => setState(() => _type = v ?? _type),
                    ),
                    const SizedBox(height: 16),
                    CustomFormFieldWithName(
                      controller: _titleController,
                      hint: 'Enter gig title',
                      title: 'Title',
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'Title is required'
                          : null,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Description",
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        // labelText: 'Description',
                        hintText: 'Enter gig description',

                        filled: true,
                        fillColor: Colors.grey.shade100,
                      ),
                      minLines: 3,
                      maxLines: 5,
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'Description is required'
                          : null,
                    ),
                    CustomFormFieldWithName(
                      title: 'No of reels',
                      controller: _reelsController,
                      hint: 'Enter no of reels',
                      keyboardType: TextInputType.number,
                      inputFormaters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'Number of reels required';
                        }
                        final n = int.tryParse(v.trim());
                        if (n == null || n <= 0) {
                          return 'Enter a valid positive integer';
                        }
                        return null;
                      },
                    ),
                    CustomFormFieldWithName(
                      title: 'Tags',
                      controller: _tagsController,
                      hint: 'e.g. social media,food,travel (comma separated)',
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'At least one tag required'
                          : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Deadline",
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _deadlineController,
                      readOnly: true,
                      onTap: _pickDeadline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter the deadline',
                        hintStyle: TextStyle(fontSize: 12),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        suffixIcon: const Icon(Icons.calendar_today),
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'Deadline is required'
                          : null,
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Budget of Reel',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Minimum',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          'Maximum',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    RangeSlider(
                      values: _budget,
                      min: 0,
                      max: 20000,
                      divisions: 20,
                      labels: RangeLabels(
                        '₹${_budget.start.toInt()}',
                        '₹${_budget.end.toInt()}',
                      ),
                      activeColor: Colors.deepOrange,
                      onChanged: (r) => setState(() => _budget = r),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '₹${(_budget.start / 1000).round()}k',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '₹${(_budget.end / 1000).round()}k',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                        ),
                        onPressed: _submit,
                        child: const Text(
                          'FIND CREATORS',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ...existing code...