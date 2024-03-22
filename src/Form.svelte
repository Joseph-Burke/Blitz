<script>
  let cardType = "";

  let grammarCard = {
    rule: "",
    example: "",
  };

  let pronunciationCard = {
    type: "",
    text: "",
  };

  let vocabCard = {
    type: "",
    text: "",
  };

  function handleSubmit(event) {
    event.preventDefault();
    
    const cardData = getCardData(cardType)
    sendCardData(cardData);
  }

  const getCardData = cardType => {
    return {
      cardType,
      ...{
        "Grammar": grammarCard,
        "Pronunciation": pronunciationCard,
        "Vocab": vocabCard,
      }[cardType],
    };
  };

  const sendCardData = cardData => {
    console.log("sending card data!", cardData)
    fetch("https://localhost:3000", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(cardData),
    })
      .then(response => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then(data => {
        console.log(data);
      })
      .catch(error => {
        console.error("Error fetching data:", error);
      });
  };
</script>

<form on:submit={handleSubmit}>
  <label for="cardType">Card Type:</label>
  <select id="cardType" bind:value={cardType}>
    <option value="">Select Card Type</option>
    <option value="Grammar">Grammar</option>
    <option value="Pronunciation">Pronunciation</option>
    <option value="Vocab">Vocab</option>
  </select>

  {#if cardType === "Grammar"}
    <label for="rule">
      Rule:
      <input bind:value={grammarCard.rule} />
    </label>

    <label>
      Example:
      <input bind:value={grammarCard.example} />
    </label>
  {:else if cardType === "Pronunciation"}
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
  {:else if cardType === "Vocab"}
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

  <button type="submit"> Submit </button>
</form>
