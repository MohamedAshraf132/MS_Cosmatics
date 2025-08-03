import '../models/product.dart';

class ProductViewModel {
  List<Product> getProducts() {
    return [
      Product(
        id: 'p1',
        name: 'Clear & Shine',
        imagePath: 'assets/images/clear_shine.jpg',
        price: 550.0,
        oldPrice: 850.0,
        description:
            'Achieve clean, soft, and glowing skin with Clear & Shine – the perfect cleanser and exfoliator for deep cleansing and effective brightening.',
        benefits: '''
• Deep & Gentle Cleansing: Removes impurities and excess oils without drying the skin.
• Brightening & Even Tone: Contains Tranexamic Acid and Niacinamide to reduce pigmentation and even out skin tone.
• Hydration & Soothing: With Glycerin and Panthenol, it maintains skin moisture and soothes irritation.''',
        howToUse:
            'Apply an appropriate amount to damp skin, gently massage in circular motions for one minute, then rinse with lukewarm water.',
      ),
      Product(
        id: 'p2',
        name: 'Glow Boost Serum',
        imagePath: 'assets/images/clear_shine.jpg',
        price: 420.0,
        oldPrice: 600.0,
        description:
            'Revitalize your skin with Glow Boost Serum – designed to restore radiance and reduce dullness.',
        benefits: '''
• Vitamin C: Brightens and evens skin tone.
• Hyaluronic Acid: Deep hydration and plumpness.
• Antioxidants: Fights environmental stressors.''',
        howToUse:
            'Apply a few drops to cleansed skin in the morning before moisturizer and sunscreen.',
      ),
      Product(
        id: 'p3',
        name: 'Hydra Moist Cream',
        imagePath: 'assets/images/clear_shine.jpg',
        price: 310.0,
        oldPrice: 470.0,
        description:
            'Hydra Moist Cream offers long-lasting hydration for dry and sensitive skin.',
        benefits: '''
• Intense Hydration: Locks in moisture for 24 hours.
• Calming Ingredients: Includes aloe vera and chamomile.
• Non-Greasy Formula: Lightweight and quick absorbing.''',
        howToUse:
            'Apply twice daily to clean skin. Massage gently until fully absorbed.',
      ),
      Product(
        id: 'p4',
        name: 'Acne Control Gel',
        imagePath: 'assets/images/clear_shine.jpg',
        price: 290.0,
        oldPrice: 400.0,
        description:
            'Fight breakouts effectively with Acne Control Gel – fast-acting formula that targets pimples and acne marks.',
        benefits: '''
• Salicylic Acid: Clears clogged pores.
• Tea Tree Oil: Natural antibacterial.
• Soothing Base: Minimizes irritation and redness.''',
        howToUse:
            'Apply a thin layer directly on pimples twice daily. Avoid eye area.',
      ),
      Product(
        id: 'p5',
        name: 'SunShield SPF 50+',
        imagePath: 'assets/images/clear_shine.jpg',
        price: 365.0,
        oldPrice: 500.0,
        description:
            'High-protection sunscreen for daily use, non-greasy and water-resistant.',
        benefits: '''
• SPF 50+ UVA/UVB: Broad spectrum protection.
• Lightweight Formula: Suitable for all skin types.
• No White Cast: Absorbs quickly without residue.''',
        howToUse:
            'Apply generously 15 minutes before sun exposure. Reapply every 2 hours.',
      ),
      Product(
        id: 'p6',
        name: 'Night Repair Elixir',
        imagePath: 'assets/images/clear_shine.jpg',
        price: 480.0,
        oldPrice: 700.0,
        description:
            'Repair and rejuvenate your skin overnight with our advanced Night Repair Elixir.',
        benefits: '''
• Retinol: Boosts collagen and reduces wrinkles.
• Peptides: Enhances skin elasticity.
• Nourishing Oils: Restores moisture while you sleep.''',
        howToUse:
            'Use in the evening. Apply 2–3 drops to clean skin before moisturizer.',
      ),
    ];
  }
}
