.class public Lcom/flyersoft/tools/A$TtsLine;
.super Ljava/lang/Object;
.source "A.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/A;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TtsLine"
.end annotation


# instance fields
.field public end:I

.field public s:Ljava/lang/String;

.field public start:I


# direct methods
.method constructor <init>(Ljava/lang/String;IILjava/lang/String;ZI)V
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p3

    move-object/from16 v2, p4

    .line 7072
    const-string v3, "Dr."

    const-string v4, "Mrs."

    const-string v5, "Mr."

    const-string v6, " "

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7075
    :try_start_0
    sget-object v7, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-eqz v7, :cond_0

    sget-object v7, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget-boolean v7, v7, Lcom/flyersoft/staticlayout/MRTextView;->hasRuby:Z

    if-eqz v7, :cond_0

    const/4 v7, 0x1

    goto :goto_0

    :cond_0
    const/4 v7, 0x0

    :goto_0
    if-eqz v7, :cond_2

    .line 7077
    sget-object v10, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v10}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v10

    if-eqz v10, :cond_2

    add-int v11, p6, p2

    add-int v12, p6, v1

    .line 7079
    const-class v13, Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    invoke-interface {v10, v11, v12, v13}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Lcom/flyersoft/staticlayout/MyHtml$Ruby;

    if-eqz v10, :cond_2

    .line 7080
    array-length v11, v10

    if-lez v11, :cond_2

    .line 7081
    array-length v11, v10
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_4

    move-object/from16 v12, p1

    const/4 v13, 0x0

    :goto_1
    if-ge v13, v11, :cond_3

    :try_start_1
    aget-object v14, v10, v13

    .line 7082
    iget-object v15, v14, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->original:Ljava/lang/String;

    invoke-static {v15}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_1

    .line 7083
    iget-object v15, v14, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->original:Ljava/lang/String;

    iget-object v14, v14, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->rt:Ljava/lang/String;

    invoke-virtual {v12, v15, v14}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v12

    :cond_1
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    :cond_2
    move-object/from16 v12, p1

    :cond_3
    const/16 v10, 0x20

    if-nez v7, :cond_4

    .line 7086
    sget-boolean v7, Lcom/flyersoft/tools/A;->isJapanese:Z

    if-eqz v7, :cond_8

    .line 7087
    :cond_4
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v11, 0x0

    .line 7088
    :goto_2
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v13

    if-ge v11, v13, :cond_7

    .line 7089
    invoke-virtual {v12, v11}, Ljava/lang/String;->charAt(I)C

    move-result v13

    invoke-static {v13}, Lcom/flyersoft/tools/A;->isSpaceChar(C)Z

    move-result v13

    if-eqz v13, :cond_5

    if-lez v11, :cond_6

    add-int/lit8 v13, v11, -0x1

    .line 7090
    invoke-virtual {v12, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    invoke-static {v13}, Lcom/flyersoft/staticlayout/MRTextView;->isSplitChar(C)Z

    move-result v13

    if-nez v13, :cond_6

    .line 7091
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v13

    sub-int/2addr v13, v9

    if-ge v11, v13, :cond_6

    add-int/lit8 v13, v11, 0x1

    invoke-virtual {v12, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    invoke-static {v13}, Lcom/flyersoft/staticlayout/MRTextView;->isSplitChar(C)Z

    move-result v13

    if-nez v13, :cond_6

    .line 7092
    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 7094
    :cond_5
    invoke-virtual {v12, v11}, Ljava/lang/String;->charAt(I)C

    move-result v13

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_6
    :goto_3
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 7095
    :cond_7
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object v12, v7

    .line 7098
    :cond_8
    invoke-static {v8}, Lcom/flyersoft/tools/A;->initTTSFilters(Z)V

    .line 7099
    sget-object v7, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_9

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/flyersoft/tools/A$Filter_Item;

    .line 7100
    iget-object v13, v11, Lcom/flyersoft/tools/A$Filter_Item;->original:Ljava/lang/String;

    iget-object v11, v11, Lcom/flyersoft/tools/A$Filter_Item;->replaceWith:Ljava/lang/String;

    sget-boolean v14, Lcom/flyersoft/tools/A;->tts_filter_with_regular_expression:Z

    invoke-static {v12, v13, v11, v14}, Lcom/flyersoft/tools/A;->do_replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v12

    goto :goto_4

    :cond_9
    const/16 v7, 0x300c

    const/16 v11, 0x22

    .line 7103
    invoke-virtual {v12, v7, v11}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    const/16 v13, 0x300d

    invoke-virtual {v7, v13, v11}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    const-string v11, " \u2019"

    .line 7104
    invoke-virtual {v7, v11, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    const-string v11, "\u2019 "

    invoke-virtual {v7, v11, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    const-string v11, "\u2018"

    invoke-virtual {v7, v11, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    const-string v11, " *\n *"

    .line 7105
    invoke-virtual {v7, v11, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/16 v11, 0x3000

    invoke-virtual {v7, v11, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    const-string v10, " +"

    .line 7106
    invoke-virtual {v7, v10, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_5

    .line 7108
    :try_start_2
    sget v7, Lcom/flyersoft/tools/A;->tts_divide:I
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_2

    const-string v10, ""

    if-nez v7, :cond_e

    .line 7110
    :goto_5
    :try_start_3
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_2

    const-string v11, " \'\u2018\u2019\u201d\u201c\""

    const/4 v12, -0x1

    if-lez v7, :cond_a

    :try_start_4
    invoke-virtual {v6, v8}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-virtual {v11, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-eq v7, v12, :cond_a

    .line 7111
    invoke-virtual {v6, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_5

    .line 7112
    :cond_a
    :goto_6
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_b

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v7, v9

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-virtual {v11, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-eq v7, v12, :cond_b

    .line 7113
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v7, v9

    invoke-virtual {v6, v8, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6
    :try_end_4
    .catch Ljava/lang/OutOfMemoryError; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_6

    :cond_b
    move/from16 v7, p2

    .line 7114
    :goto_7
    :try_start_5
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-le v8, v7, :cond_c

    if-lez v7, :cond_c

    if-ge v7, v1, :cond_c

    const-string v8, "\u3000 ,.;?:\\)}]!\uff0c\u3002\uff1b\u201d\uff1a\uff1f\uff09\u3001\uff01\n\t\r"

    .line 7117
    invoke-virtual {v2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    if-eq v8, v12, :cond_c

    add-int/lit8 v7, v7, 0x1

    goto :goto_7

    .line 7119
    :cond_c
    :goto_8
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-le v8, v1, :cond_d

    if-le v1, v7, :cond_d

    const-string v8, "\u3000 \\({[\u201c\uff08\n\t\r"

    add-int/lit8 v9, v1, -0x1

    .line 7122
    invoke-virtual {v2, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    if-eq v8, v12, :cond_d

    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    .line 7124
    :cond_d
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-le v8, v1, :cond_f

    if-le v1, v7, :cond_f

    const-string v8, ",.;\uff0c\u3002\uff1b?\uff1f!\uff01"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7125
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v12, :cond_f

    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_e
    move/from16 v7, p2

    :cond_f
    :goto_9
    if-eqz p5, :cond_10

    .line 7130
    const-string v2, "\u2600"

    invoke-virtual {v6, v2, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2
    :try_end_5
    .catch Ljava/lang/OutOfMemoryError; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_a

    :cond_10
    move-object v2, v6

    .line 7131
    :goto_a
    :try_start_6
    const-string v6, "\u2500\u2500\u2500"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6
    :try_end_6
    .catch Ljava/lang/OutOfMemoryError; {:try_start_6 .. :try_end_6} :catch_1

    if-eqz v6, :cond_11

    goto :goto_b

    :cond_11
    move-object v10, v2

    .line 7133
    :goto_b
    :try_start_7
    const-string v2, "#1^"

    invoke-virtual {v10, v2, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const-string v6, "#11^"

    invoke-virtual {v2, v6, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const-string v6, "#2^"

    invoke-virtual {v2, v6, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2
    :try_end_7
    .catch Ljava/lang/OutOfMemoryError; {:try_start_7 .. :try_end_7} :catch_0

    .line 7134
    :try_start_8
    sget-object v6, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_12
    :goto_c
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_14

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/tools/A$Filter_Item;

    .line 7135
    iget-object v9, v8, Lcom/flyersoft/tools/A$Filter_Item;->original:Ljava/lang/String;

    invoke-virtual {v9, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_13

    iget-object v9, v8, Lcom/flyersoft/tools/A$Filter_Item;->original:Ljava/lang/String;

    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_13

    iget-object v9, v8, Lcom/flyersoft/tools/A$Filter_Item;->original:Ljava/lang/String;

    invoke-virtual {v9, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_12

    .line 7136
    :cond_13
    iget-object v9, v8, Lcom/flyersoft/tools/A$Filter_Item;->original:Ljava/lang/String;

    iget-object v8, v8, Lcom/flyersoft/tools/A$Filter_Item;->replaceWith:Ljava/lang/String;

    sget-boolean v10, Lcom/flyersoft/tools/A;->tts_filter_with_regular_expression:Z

    invoke-static {v2, v9, v8, v10}, Lcom/flyersoft/tools/A;->do_replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2
    :try_end_8
    .catch Ljava/lang/OutOfMemoryError; {:try_start_8 .. :try_end_8} :catch_1

    goto :goto_c

    :catch_0
    move-object v12, v10

    goto :goto_d

    :catch_1
    move-object v12, v2

    goto :goto_d

    :catch_2
    move/from16 v7, p2

    :catch_3
    move-object v12, v6

    goto :goto_d

    :catch_4
    move-object/from16 v12, p1

    :catch_5
    move/from16 v7, p2

    :goto_d
    move-object v2, v12

    .line 7141
    :cond_14
    iput-object v2, v0, Lcom/flyersoft/tools/A$TtsLine;->s:Ljava/lang/String;

    .line 7142
    iput v7, v0, Lcom/flyersoft/tools/A$TtsLine;->start:I

    .line 7143
    iput v1, v0, Lcom/flyersoft/tools/A$TtsLine;->end:I

    return-void
.end method


# virtual methods
.method public isAvialable()Z
    .locals 5

    .line 7147
    iget v0, p0, Lcom/flyersoft/tools/A$TtsLine;->end:I

    iget v1, p0, Lcom/flyersoft/tools/A$TtsLine;->start:I

    const/4 v2, 0x0

    if-le v0, v1, :cond_1

    iget-object v0, p0, Lcom/flyersoft/tools/A$TtsLine;->s:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    iget-object v0, p0, Lcom/flyersoft/tools/A$TtsLine;->s:Ljava/lang/String;

    .line 7148
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/flyersoft/tools/A$TtsLine;->s:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const v3, 0xfffc

    if-eq v0, v3, :cond_1

    sget-object v0, Lcom/flyersoft/tools/A;->PUNCTUATIONS:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, ""

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/flyersoft/tools/A$TtsLine;->s:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v3, -0x1

    if-ne v0, v3, :cond_1

    :cond_0
    return v1

    :cond_1
    return v2
.end method
