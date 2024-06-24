import 'package:flutter/material.dart';

import '../../../model/domain/item.dart';

class ProductInBasketItemWidget extends StatefulWidget {
  const ProductInBasketItemWidget({super.key, required this.item,required this.isSelected,
    required this.onToggle, required this.onDelete, required this.onIncrementItemButtonPressed, required this.onDecrementItemButtonPressed, required this.count,});

 final Item item;
  final bool isSelected;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback onIncrementItemButtonPressed;
  final VoidCallback onDecrementItemButtonPressed;
  final int count;


  @override
  State<ProductInBasketItemWidget> createState() =>
      _ProductInBasketItemWidgetState();
}

class _ProductInBasketItemWidgetState extends State<ProductInBasketItemWidget> {
  int _count = 1;
  bool _isSelected = true;
  late String selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.item.sizes.first;
  }

  void _showSizeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Size"),
          content: SingleChildScrollView(
            child: Column(
              children: widget.item.sizes.map((size) {
                return RadioListTile<String>(
                  title: Text(size),
                  value: size,
                  groupValue: selectedSize,
                  onChanged: (String? value) {
                    setState(() {
                      selectedSize = value!;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200, width: 1),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                    _buildCheckbox(),
                _buildProductImage(),
                _buildProductDetails(media, textTheme),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildCheckbox() {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 35,
      child: InkWell(
        onTap: widget.onToggle,
        child: Container(
          decoration: BoxDecoration(
            color: widget.isSelected ? Theme.of(context).primaryColor : Colors.transparent,
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
          width: 15,
          height: 15,
        ),
      ),
    );
  }
  Widget _buildDeleteButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: widget.onDelete,
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      height: 150,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          widget.item.picture,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductDetails(Size media, TextTheme textTheme) {
    return Container(
      width: media.width - 50 - 140,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5,),
          Text(
            maxLines: 1,
            widget.item.title,
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 5),
          _buildPriceAndRating(textTheme),
          const SizedBox(height: 10),
          _buildSizeAndQuantity(textTheme),
           Row(
             mainAxisSize: MainAxisSize.min,
             children: [
                _buildItemCost(textTheme),
               Positioned(
                 right: 10,
                   child: _buildDeleteButton())
             ],
           )

        ],
      ),
    );
  }


  Widget _buildPriceAndRating(TextTheme textTheme) {
    return Row(
      children: [
        Text(
          "\$${widget.item.price.toStringAsFixed(2)}",
          style: textTheme.bodyMedium?.copyWith(color: Colors.red),
        ),
        const SizedBox(width: 15),
        Text(
          "⭐${widget.item.rating}",
          style: textTheme.bodyMedium?.copyWith(color: Colors.yellow),
        ),
      ],
    );
  }

  Widget _buildSizeAndQuantity(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: _showSizeDialog,
          child: Row(
            children: [
              Text(
                "Size",
                style: textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
              const SizedBox(width: 5),
              Text(selectedSize, style: const TextStyle(fontSize: 14),),
              const SizedBox(width: 1),
              const Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
        _buildQuantityControls(),
      ],
    );
  }

  Widget _buildQuantityControls() {
    return Row(
      children: [
        _buildQuantityButton(Icons.remove, widget.onDecrementItemButtonPressed,),
        const SizedBox(width: 5,),
        Text(
          widget.count.toString(),
          style: const TextStyle(fontSize: 16),
        ), const SizedBox(width: 5,),
        _buildQuantityButton(Icons.add,widget.onIncrementItemButtonPressed),
      ],
    );
  }


  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return SizedBox(height: 35,width: 35,
      child: IconButton(
        color: Colors.black,
        style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.grey.shade100,)),
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 16,),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildTotalCost(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Total Cost: \$${(_count * widget.item.price).toStringAsFixed(2)}",
        style: textTheme.bodyMedium?.copyWith(fontSize: 14),
      ),
    );
  }
  Widget _buildItemCost(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Cost: \$${(_count * widget.item.price).toStringAsFixed(2)}",
        style: textTheme.bodyMedium?.copyWith(fontSize: 14),
      ),
    );
  }
}
