Feature: AI Product Categorization
  As a product manager
  I want to automatically categorize products using AI
  So that I can maintain consistent product classification with minimal manual effort

  Background:
    Given I am authenticated as a user with "PRODUCT_MANAGER" role
    And the AI categorization service is available
    And there are existing product categories in the system

  @ai-categorization @high-priority
  Scenario: Auto-categorize product from image
    Given I have a product with an image but no category
    And the image contains recognizable product features
    When I run AI categorization
    Then the product should be assigned the correct category
    And the confidence score should be above 80%
    And the categorization reasoning should be provided
    And the model version should be recorded

  @ai-categorization @edge-case
  Scenario: Handle low confidence categorization
    Given I have a product with an ambiguous image
    When I run AI categorization
    Then the system should provide multiple category suggestions
    And each suggestion should have a confidence score
    And no category should be auto-assigned if confidence is below 60%
    And the system should flag the product for manual review

  @ai-categorization @integration
  Scenario: Categorize product from text description
    Given I have a product with only a text description
    And the description is "Apple MacBook Pro 16-inch with M2 Max chip, 32GB RAM, 1TB SSD"
    When I run AI categorization
    Then the product should be categorized under "Electronics/Computers/Laptops"
    And the AI should extract relevant specifications
    And the confidence score should be above 85%

  @ai-categorization @batch-processing
  Scenario: Batch categorize multiple products
    Given I have 50 products without categories
    When I run batch AI categorization
    Then all products should be processed
    And categorization should complete within 2 minutes
    And a summary report should be generated
    And any errors should be logged with details

  @ai-categorization @feedback-loop
  Scenario: Learn from manual corrections
    Given an AI has categorized a product as "Electronics/Audio/Headphones"
    And a human corrects the category to "Electronics/Audio/Speakers"
    When the feedback is submitted
    Then the AI model should record this correction
    And future similar products should benefit from this feedback
    And the correction should improve model accuracy

  @ai-categorization @multi-category
  Scenario: Assign multiple categories to complex products
    Given I have a product that fits multiple categories
    And the product is a "Gaming Chair with Built-in Speakers"
    When I run AI categorization
    Then the product should be assigned to both "Furniture/Chairs" and "Gaming/Accessories"
    And each category assignment should have its own confidence score
    And the primary category should be identified

  @ai-categorization @new-category-detection
  Scenario: Detect potential new category needs
    Given I have products that don't fit existing categories well
    When I run AI categorization analysis
    Then the system should identify patterns in uncategorized products
    And suggest potential new categories
    And provide evidence for each suggestion
    And flag this for administrative review

  @ai-categorization @performance
  Scenario: Ensure categorization performance meets SLA
    Given I have 100 products to categorize
    When I run AI categorization
    Then each product should be processed within 5 seconds
    And the total batch should complete within 2 minutes
    And system resources should not exceed 80% utilization
    And all categorizations should be persisted successfully