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

    const cardData = getCardData(cardType);

    sendCardData(cardData);
  }

  const getCardData = (cardType) => {
    return {
      card: {
        ...{
          Grammar: grammarCard,
          Pronunciation: pronunciationCard,
          Vocab: vocabCard,
        }[cardType],
      },
    };
  };

  const sendCardData = (cardData) => {
    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      cache: "no-cache",
      credentials: "same-origin",
      body: JSON.stringify(cardData)
    })
      .then(response => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then((data) => {
        console.log(data);
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  };

  $: url = `http://localhost:3000/cards/${cardType}`;
</script>

<form on:submit={handleSubmit}>
  <label for="cardType">Card Type:</label>
  <select id="cardType" bind:value={cardType}>
    <option value="">Select Card Type</option>
    <option value="grammar">Grammar</option>
    <option value="pronunciation">Pronunciation</option>
    <option value="vocab/noun">Vocab (Noun)</option>
    <option value="vocab/verb">Vocab (Verb)</option>
  </select>

  {#if cardType === "grammar"}
    <label for="rule">
      Rule:
      <input bind:value={grammarCard.rule} />
    </label>

    <label>
      Example:
      <input bind:value={grammarCard.example} />
    </label>
  {:else if cardType === "pronunciation"}
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
  {:else if cardType === "vocab/noun" || cardType === "vocab/verb"}
    <label>
      <input bind:value={vocabCard.text} />
    </label>
  {/if}

  <button type="submit"> Submit </button>
</form>
