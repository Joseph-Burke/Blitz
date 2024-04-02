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

  let vocabCard = {};

  let lastCard = null;

  $: {
    console.log(lastCard);
  }

  function handleSubmit(event) {
    event.preventDefault();

    const cardData = getCardData(cardType);

    sendCardData(cardData);
  }

  const getCardData = (cardType) => {
    return {
      card: {
        ...{
          grammar: grammarCard,
          pronunciation: pronunciationCard,
          "vocab/noun": vocabCard,
          "vocab/verb": vocabCard,
        }[cardType],
      },
    };
  };

  const sendCardData = (cardData) => {
    console.log(cardData);
    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      cache: "no-cache",
      credentials: "same-origin",
      body: JSON.stringify(cardData),
    })
      .then((response) => {
        return response.json();
      })
      .then((data) => {
        console.log(data);
        lastCard = data;
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
  {:else if cardType === "vocab/noun"}
    <label>
      <input bind:value={vocabCard.noun} />
    </label>
  {:else if cardType === "vocab/verb"}
    <label>
      <input bind:value={vocabCard.verb} />
    </label>
  {/if}

  <button type="submit"> Submit </button>

  {#if lastCard !== null}
    {#if lastCard.result !== null}
      <p>Last card was created successfully.</p>
    {:else}
      <p>Last card creation failed.</p>
    {/if}
  {/if}
</form>
