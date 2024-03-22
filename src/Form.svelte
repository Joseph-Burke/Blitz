<script>
  let cardType = '';

  let grammarCard = {
    rule: '',
    example: ''
  }
  
  let pronunciationCard = {
    type: '',
    text: ''
  }

  let vocabCard = {
    type: '',
    text: ''
  }

  function handleSubmit(event) {
    event.preventDefault();
    console.log('Form submitted!', formData);
  }
</script>

<form on:submit={handleSubmit}>
  <label for="cardType">Card Type:</label>
  <select id="cardType" bind:value={cardType}>
    <option value="">Select Card Type</option>
    <option value="Grammar">Grammar</option>
    <option value="Pronunciation">Pronunciation</option>
    <option value="Vocab">Vocab</option>
  </select>

  {#if cardType === 'Grammar'}
    <label for="rule">
      Rule:
      <input bind:value={grammarCard.rule} />
    </label>

    <label>
      Example:
      <input bind:value={grammarCard.example} />
    </label>

  {:else if cardType === 'Pronunciation'}
    <label for="pronunciationField">
      Type of text:

      <select bind:value={pronunciationCard.type}>
        <option value="">Select Type</option>
        <option value="IPA">International Phonetic Alphabet</option>
        <option value="German">German</option>
      </select>
    </label>

      {#if pronunciationCard.type}
        <label>
          {pronunciationCard.type} text
          <input bind:value={pronunciationCard.text} />
        </label>
      {/if}

  {:else if cardType === 'Vocab'}
    <label>
      Vocabulary type:
      <select bind:value={vocabCard.type}>
        <option value="Noun" selected>Noun</option>
        <option value="Verb">Verb</option>
      </select>
    </label>
    
    {#if vocabCard.type}
      <label>
        {vocabCard.type}:
          <input bind:value={vocabCard.text} />
        </label>
    {/if}
  {/if}

  <button type="submit">
    Submit
  </button>
</form>
