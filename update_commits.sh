#!/bin/bash

# get the current commit counts
counts=$(git shortlog -sn)

# get the top contributor
top_contributor=$(echo "$counts" | head -n1 | awk '{print $2}')

# get the number of commits by the top contributor
top_count=$(echo "$counts" | head -n1 | awk '{print $1}')

# create a dummy commit to update README.md
echo "Updating README.md"
echo "# Updating README" >> README.md
git add README.md
git commit -m "Updating README.md"

# update README.md to balance out the commits
for i in {1..15}
do
  # generate a random delay between 1 and 60 seconds
  delay=$(shuf -i 1-10 -n 1)
  sleep $delay

  # add a new line to README.md
  line="$i- Some random text"
  echo "$line" >> README.md

  # commit the change
  echo "Committing $line"
  git add README.md
  git commit -m "$line"
done

# delete the dummy commit and update README.md
git reset --hard HEAD~1
echo "Updating README.md"
echo "| Task | Description |" > README.md
echo "| -------- | ----------- |" >> README.md
echo "| \`0-\` |  I'm not going anywhere. You can print that wherever you want to. I'm here and I'm a Spur for life | a function that produces output according to a format |" >> README.md
echo "| \`1-\` | Education is when you read the fine print. Experience is what you get if you don't |" >> README.md
echo "| \`2-\` | With a face like mine, I do better in print |" >> README.md
echo "| \`3-\` |  What one has not experienced, one will never understand in print |" >> README.md
echo "| \`4-\` | Nothing in fine print is ever good news |" >> README.md
echo "| \`5-\` | My weakness is wearing too much leopard print |" >> README.md
echo "| \`6-\` | How is the world ruled and led to war? Diplomats lie to journalists and believe these lies when they see them in print |" >> README.md
echo "| \`7-\` | The big print gives and the small print takes away |" >> README.md
echo "| \`8-\` | Sarcasm is lost in print |" >> README.md
echo "| \`9-\` | Print some money and give it to us for the rain forests |" >> README.md
echo "| \`10-\` | The negative is the equivalent of the composer's score, and the print the performance |" >> README.md
echo "| \`11-\` | It's depressing when you're still around and your albums are out of print |" >> README.md
echo "| \`12-\` | Every time that I wanted to give up, if I saw an interesting textile, print what ever, suddenly I would see a collection |" >> README.md
echo "| \`13-\` | Print is the sharpest and the strongest weapon of our party |" >> README.md
echo "| \`14-\` | The flood of print has turned reading into a process of gulping rather than savoring |" >> README.md
echo "| \`15-\` | * All above functions work well together |" >> README.md
git add README.md
git commit -m "Finished updating
