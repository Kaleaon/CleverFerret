.class public Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;
.super Lcom/flyersoft/components/androidsvg/utils/TextScanner;
.source "CSSTextScanner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner$AnPlusB;
    }
.end annotation


# static fields
.field static final PATTERN_BLOCK_COMMENTS:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 25
    const-string v0, "(?s)/\\*.*?\\*/"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->PATTERN_BLOCK_COMMENTS:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 29
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->PATTERN_BLOCK_COMMENTS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method private hexChar(I)I
    .locals 2

    const/16 v0, 0x30

    if-lt p1, v0, :cond_0

    const/16 v1, 0x39

    if-gt p1, v1, :cond_0

    sub-int/2addr p1, v0

    return p1

    :cond_0
    const/16 v0, 0x41

    if-lt p1, v0, :cond_1

    const/16 v0, 0x46

    if-gt p1, v0, :cond_1

    add-int/lit8 p1, p1, -0x37

    return p1

    :cond_1
    const/16 v0, 0x61

    if-lt p1, v0, :cond_2

    const/16 v0, 0x66

    if-gt p1, v0, :cond_2

    add-int/lit8 p1, p1, -0x57

    return p1

    :cond_2
    const/4 p1, -0x1

    return p1
.end method

.method private nextAnPlusB()Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner$AnPlusB;
    .locals 13

    .line 249
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 252
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    const/16 v2, 0x28

    .line 254
    invoke-virtual {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v2

    if-nez v2, :cond_1

    return-object v1

    .line 256
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 259
    const-string v2, "odd"

    invoke-virtual {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v2, :cond_2

    .line 260
    new-instance v2, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner$AnPlusB;

    invoke-direct {v2, v3, v4}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner$AnPlusB;-><init>(II)V

    goto/16 :goto_7

    .line 261
    :cond_2
    const-string v2, "even"

    invoke-virtual {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(Ljava/lang/String;)Z

    move-result v2

    const/4 v5, 0x0

    if-eqz v2, :cond_3

    .line 262
    new-instance v2, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner$AnPlusB;

    invoke-direct {v2, v3, v5}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner$AnPlusB;-><init>(II)V

    goto/16 :goto_7

    :cond_3
    const/16 v2, 0x2b

    .line 269
    invoke-virtual {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v3

    const/4 v6, -0x1

    const/16 v7, 0x2d

    if-eqz v3, :cond_4

    goto :goto_0

    .line 271
    :cond_4
    invoke-virtual {p0, v7}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v3

    if-eqz v3, :cond_5

    const/4 v3, -0x1

    goto :goto_1

    :cond_5
    :goto_0
    const/4 v3, 0x1

    .line 276
    :goto_1
    iget-object v8, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->input:Ljava/lang/String;

    iget v9, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    iget v10, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->inputLength:I

    invoke-static {v8, v9, v10, v5}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->parseInt(Ljava/lang/String;IIZ)Lcom/flyersoft/components/androidsvg/utils/IntegerParser;

    move-result-object v8

    if-eqz v8, :cond_6

    .line 278
    invoke-virtual {v8}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->getEndPos()I

    move-result v9

    iput v9, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    :cond_6
    const/16 v9, 0x6e

    .line 280
    invoke-virtual {p0, v9}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v9

    if-nez v9, :cond_8

    const/16 v9, 0x4e

    invoke-virtual {p0, v9}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v9

    if-eqz v9, :cond_7

    goto :goto_2

    :cond_7
    move-object v2, v8

    move-object v8, v1

    goto :goto_4

    :cond_8
    :goto_2
    if-eqz v8, :cond_9

    goto :goto_3

    .line 281
    :cond_9
    new-instance v8, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;

    const-wide/16 v9, 0x1

    iget v11, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    invoke-direct {v8, v9, v10, v11}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;-><init>(JI)V

    .line 285
    :goto_3
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 287
    invoke-virtual {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v2

    if-nez v2, :cond_a

    .line 289
    invoke-virtual {p0, v7}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v2

    if-eqz v2, :cond_a

    const/4 v4, -0x1

    :cond_a
    if-eqz v2, :cond_c

    .line 295
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 296
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->input:Ljava/lang/String;

    iget v6, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    iget v7, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->inputLength:I

    invoke-static {v2, v6, v7, v5}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->parseInt(Ljava/lang/String;IIZ)Lcom/flyersoft/components/androidsvg/utils/IntegerParser;

    move-result-object v2

    if-eqz v2, :cond_b

    .line 298
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->getEndPos()I

    move-result v6

    iput v6, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    move v12, v4

    move v4, v3

    move v3, v12

    goto :goto_4

    .line 300
    :cond_b
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    return-object v1

    :cond_c
    move v2, v4

    move v4, v3

    move v3, v2

    move-object v2, v1

    .line 306
    :goto_4
    new-instance v6, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner$AnPlusB;

    if-nez v8, :cond_d

    const/4 v4, 0x0

    goto :goto_5

    :cond_d
    invoke-virtual {v8}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->value()I

    move-result v7

    mul-int v4, v4, v7

    :goto_5
    if-nez v2, :cond_e

    goto :goto_6

    .line 307
    :cond_e
    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->value()I

    move-result v2

    mul-int v5, v3, v2

    :goto_6
    invoke-direct {v6, v4, v5}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner$AnPlusB;-><init>(II)V

    move-object v2, v6

    .line 310
    :goto_7
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    const/16 v3, 0x29

    .line 311
    invoke-virtual {p0, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v3

    if-eqz v3, :cond_f

    return-object v2

    .line 314
    :cond_f
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    return-object v1
.end method

.method private nextAttribValue()Ljava/lang/String;
    .locals 1

    .line 516
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 519
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextQuotedString()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    return-object v0

    .line 522
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextIdentifier()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private nextIdentListParam()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 325
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 328
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    const/16 v2, 0x28

    .line 331
    invoke-virtual {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v2

    if-nez v2, :cond_1

    return-object v1

    .line 333
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    move-object v2, v1

    .line 336
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextIdentifier()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3

    .line 338
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    return-object v1

    :cond_3
    if-nez v2, :cond_4

    .line 342
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 343
    :cond_4
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 344
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 345
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipCommaWhitespace()Z

    move-result v3

    if-nez v3, :cond_2

    const/16 v3, 0x29

    .line 347
    invoke-virtual {p0, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v3

    if-eqz v3, :cond_5

    return-object v2

    .line 350
    :cond_5
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    return-object v1
.end method

.method private nextPseudoNotParam()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/utils/CSSParseException;
        }
    .end annotation

    .line 360
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 363
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    const/16 v2, 0x28

    .line 365
    invoke-virtual {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v2

    if-nez v2, :cond_1

    return-object v1

    .line 367
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 370
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextSelectorGroup()Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_2

    .line 373
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    return-object v1

    :cond_2
    const/16 v3, 0x29

    .line 377
    invoke-virtual {p0, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v3

    if-nez v3, :cond_3

    .line 378
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    return-object v1

    .line 383
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;

    .line 384
    iget-object v4, v3, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->simpleSelectors:Ljava/util/List;

    if-nez v4, :cond_5

    goto :goto_1

    .line 386
    :cond_5
    iget-object v3, v3, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->simpleSelectors:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;

    .line 387
    iget-object v5, v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->pseudos:Ljava/util/List;

    if-nez v5, :cond_7

    goto :goto_0

    .line 389
    :cond_7
    iget-object v4, v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->pseudos:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_8
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClass;

    .line 390
    instance-of v5, v5, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNot;

    if-eqz v5, :cond_8

    return-object v1

    :cond_9
    :goto_1
    return-object v2
.end method

.method private parsePseudoClass(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/utils/CSSParseException;
        }
    .end annotation

    .line 407
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextIdentifier()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 412
    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    move-result-object v1

    .line 413
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$CSSParser$PseudoClassIdents:[I

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const-string v3, "Invalid or missing parameter section for pseudo class: "

    const/4 v4, 0x1

    const/4 v5, 0x0

    packed-switch v2, :pswitch_data_0

    .line 502
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "Unsupported pseudo class: "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 497
    :pswitch_0
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNotSupported;

    invoke-direct {v1, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNotSupported;-><init>(Ljava/lang/String;)V

    .line 498
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    goto/16 :goto_6

    .line 483
    :pswitch_1
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextIdentListParam()Ljava/util/List;

    .line 484
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNotSupported;

    invoke-direct {v1, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNotSupported;-><init>(Ljava/lang/String;)V

    .line 485
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    goto/16 :goto_6

    .line 478
    :pswitch_2
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassTarget;

    invoke-direct {v1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassTarget;-><init>()V

    .line 479
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    goto/16 :goto_6

    .line 469
    :pswitch_3
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextPseudoNotParam()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 472
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNot;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNot;-><init>(Ljava/util/List;)V

    .line 473
    move-object v1, v0

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNot;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNot;->getSpecificity()I

    move-result v1

    iput v1, p1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->specificity:I

    goto/16 :goto_5

    .line 471
    :cond_0
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 459
    :pswitch_4
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->nth_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    if-eq v1, v2, :cond_2

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->nth_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    if-ne v1, v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v9, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v9, 0x1

    .line 460
    :goto_1
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->nth_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    if-eq v1, v2, :cond_4

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->nth_last_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    if-ne v1, v2, :cond_3

    goto :goto_2

    :cond_3
    const/4 v10, 0x0

    goto :goto_3

    :cond_4
    :goto_2
    const/4 v10, 0x1

    .line 461
    :goto_3
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextAnPlusB()Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner$AnPlusB;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 464
    new-instance v6, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;

    iget v7, v1, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner$AnPlusB;->a:I

    iget v8, v1, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner$AnPlusB;->b:I

    iget-object v11, p2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->tag:Ljava/lang/String;

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;-><init>(IIZZLjava/lang/String;)V

    .line 465
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    goto :goto_4

    .line 463
    :cond_5
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 451
    :pswitch_5
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassEmpty;

    invoke-direct {v1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassEmpty;-><init>()V

    .line 452
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    goto :goto_6

    .line 446
    :pswitch_6
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassRoot;

    invoke-direct {v1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassRoot;-><init>()V

    .line 447
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    goto :goto_6

    .line 441
    :pswitch_7
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassOnlyChild;

    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->tag:Ljava/lang/String;

    invoke-direct {v1, v4, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassOnlyChild;-><init>(ZLjava/lang/String;)V

    .line 442
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    goto :goto_6

    .line 436
    :pswitch_8
    new-instance v5, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;

    const/4 v9, 0x1

    iget-object v10, p2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->tag:Ljava/lang/String;

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;-><init>(IIZZLjava/lang/String;)V

    .line 437
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    move-object v1, v5

    goto :goto_6

    .line 431
    :pswitch_9
    new-instance v6, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;

    const/4 v10, 0x1

    iget-object v11, p2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->tag:Ljava/lang/String;

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x1

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;-><init>(IIZZLjava/lang/String;)V

    .line 432
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    goto :goto_4

    .line 426
    :pswitch_a
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassOnlyChild;

    const/4 v0, 0x0

    invoke-direct {v1, v5, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassOnlyChild;-><init>(ZLjava/lang/String;)V

    .line 427
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    goto :goto_6

    .line 421
    :pswitch_b
    new-instance v6, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;-><init>(IIZZLjava/lang/String;)V

    .line 422
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    :goto_4
    move-object v1, v6

    goto :goto_6

    .line 416
    :pswitch_c
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;-><init>(IIZZLjava/lang/String;)V

    .line 417
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    :goto_5
    move-object v1, v0

    .line 506
    :goto_6
    invoke-virtual {p2, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->addPseudo(Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClass;)V

    return-void

    .line 409
    :cond_6
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    const-string p2, "Invalid pseudo class"

    invoke-direct {p1, p2}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private scanForIdentifier()I
    .locals 10

    .line 64
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    return v0

    .line 66
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    .line 67
    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    .line 69
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->input:Ljava/lang/String;

    iget v3, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2d

    if-ne v2, v3, :cond_1

    .line 71
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->advanceChar()I

    move-result v2

    :cond_1
    const/16 v4, 0x80

    const/16 v5, 0x5f

    const/16 v6, 0x7a

    const/16 v7, 0x5a

    const/16 v8, 0x61

    const/16 v9, 0x41

    if-lt v2, v9, :cond_2

    if-le v2, v7, :cond_4

    :cond_2
    if-lt v2, v8, :cond_3

    if-le v2, v6, :cond_4

    :cond_3
    if-eq v2, v3, :cond_4

    if-eq v2, v5, :cond_4

    if-lt v2, v4, :cond_9

    .line 75
    :cond_4
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->advanceChar()I

    move-result v1

    :goto_0
    if-lt v1, v9, :cond_5

    if-le v1, v7, :cond_a

    :cond_5
    if-lt v1, v8, :cond_6

    if-le v1, v6, :cond_a

    :cond_6
    const/16 v2, 0x30

    if-lt v1, v2, :cond_7

    const/16 v2, 0x39

    if-le v1, v2, :cond_a

    :cond_7
    if-eq v1, v3, :cond_a

    if-eq v1, v5, :cond_a

    if-lt v1, v4, :cond_8

    goto :goto_1

    .line 80
    :cond_8
    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    .line 82
    :cond_9
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    return v1

    .line 78
    :cond_a
    :goto_1
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->advanceChar()I

    move-result v1

    goto :goto_0
.end method


# virtual methods
.method public nextCSSString()Ljava/lang/String;
    .locals 8

    .line 552
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 554
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->input:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x27

    if-eq v0, v2, :cond_1

    const/16 v2, 0x22

    if-eq v0, v2, :cond_1

    return-object v1

    .line 559
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 560
    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    .line 561
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextChar()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    :goto_0
    const/4 v4, -0x1

    if-eq v2, v4, :cond_8

    if-eq v2, v0, :cond_8

    const/16 v5, 0x5c

    if-ne v2, v5, :cond_7

    .line 566
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextChar()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v4, :cond_2

    goto :goto_0

    :cond_2
    const/16 v5, 0xa

    if-eq v2, v5, :cond_6

    const/16 v5, 0xd

    if-eq v2, v5, :cond_6

    const/16 v5, 0xc

    if-ne v2, v5, :cond_3

    goto :goto_3

    .line 573
    :cond_3
    invoke-direct {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->hexChar(I)I

    move-result v5

    if-eq v5, v4, :cond_7

    const/4 v6, 0x1

    :goto_1
    const/4 v7, 0x5

    if-gt v6, v7, :cond_5

    .line 577
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextChar()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 578
    invoke-direct {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->hexChar(I)I

    move-result v7

    if-ne v7, v4, :cond_4

    goto :goto_2

    :cond_4
    mul-int/lit8 v5, v5, 0x10

    add-int/2addr v5, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_5
    :goto_2
    int-to-char v4, v5

    .line 583
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 570
    :cond_6
    :goto_3
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextChar()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_0

    :cond_7
    int-to-char v2, v2

    .line 589
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 590
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextChar()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_0

    .line 592
    :cond_8
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public nextIdentifier()Ljava/lang/String;
    .locals 3

    .line 37
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->scanForIdentifier()I

    move-result v0

    .line 38
    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 40
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->input:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 41
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    return-object v1
.end method

.method nextLegacyURL()Ljava/lang/String;
    .locals 7

    .line 647
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 649
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v1

    if-nez v1, :cond_8

    .line 651
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->input:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x27

    if-eq v1, v2, :cond_8

    const/16 v2, 0x22

    if-eq v1, v2, :cond_8

    const/16 v2, 0x28

    if-eq v1, v2, :cond_8

    const/16 v2, 0x29

    if-eq v1, v2, :cond_8

    .line 653
    invoke-virtual {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->isWhitespace(I)Z

    move-result v2

    if-nez v2, :cond_8

    invoke-static {v1}, Ljava/lang/Character;->isISOControl(I)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_3

    .line 656
    :cond_1
    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    const/16 v2, 0x5c

    if-ne v1, v2, :cond_7

    .line 659
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 662
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->input:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    add-int/lit8 v4, v2, 0x1

    iput v4, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0xa

    if-eq v1, v2, :cond_0

    const/16 v2, 0xd

    if-eq v1, v2, :cond_0

    const/16 v2, 0xc

    if-ne v1, v2, :cond_3

    goto :goto_0

    .line 666
    :cond_3
    invoke-direct {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->hexChar(I)I

    move-result v2

    const/4 v4, -0x1

    if-eq v2, v4, :cond_7

    const/4 v1, 0x1

    :goto_1
    const/4 v5, 0x5

    if-gt v1, v5, :cond_6

    .line 670
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v5

    if-eqz v5, :cond_4

    goto :goto_2

    .line 672
    :cond_4
    iget-object v5, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->input:Ljava/lang/String;

    iget v6, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-direct {p0, v5}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->hexChar(I)I

    move-result v5

    if-ne v5, v4, :cond_5

    goto :goto_2

    .line 675
    :cond_5
    iget v6, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    add-int/2addr v6, v3

    iput v6, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    mul-int/lit8 v2, v2, 0x10

    add-int/2addr v2, v5

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_6
    :goto_2
    int-to-char v1, v2

    .line 678
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    :cond_7
    int-to-char v1, v1

    .line 684
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 686
    :cond_8
    :goto_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-nez v1, :cond_9

    const/4 v0, 0x0

    return-object v0

    .line 688
    :cond_9
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public nextPropertyValue()Ljava/lang/String;
    .locals 5

    .line 530
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 532
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    .line 533
    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    .line 535
    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->input:Ljava/lang/String;

    iget v4, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    :goto_0
    const/4 v4, -0x1

    if-eq v3, v4, :cond_2

    const/16 v4, 0x3b

    if-eq v3, v4, :cond_2

    const/16 v4, 0x7d

    if-eq v3, v4, :cond_2

    const/16 v4, 0x21

    if-eq v3, v4, :cond_2

    .line 536
    invoke-virtual {p0, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->isEOL(I)Z

    move-result v4

    if-nez v4, :cond_2

    .line 537
    invoke-virtual {p0, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->isWhitespace(I)Z

    move-result v3

    if-nez v3, :cond_1

    .line 538
    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    add-int/lit8 v2, v2, 0x1

    .line 539
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->advanceChar()I

    move-result v3

    goto :goto_0

    .line 541
    :cond_2
    iget v3, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    if-le v3, v0, :cond_3

    .line 542
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->input:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 543
    :cond_3
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    return-object v1
.end method

.method public nextSelectorGroup()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/utils/CSSParseException;
        }
    .end annotation

    .line 92
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 95
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 96
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;

    invoke-direct {v1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;-><init>()V

    .line 98
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 100
    invoke-virtual {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextSimpleSelector(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 103
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipCommaWhitespace()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    .line 105
    :cond_1
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;

    invoke-direct {v1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;-><init>()V

    goto :goto_0

    .line 111
    :cond_2
    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    .line 112
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    return-object v0
.end method

.method nextSimpleSelector(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/utils/CSSParseException;
        }
    .end annotation

    .line 124
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 127
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    .line 131
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_2

    const/16 v2, 0x3e

    .line 133
    invoke-virtual {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 134
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->CHILD:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    .line 135
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    goto :goto_0

    :cond_1
    const/16 v2, 0x2b

    .line 136
    invoke-virtual {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 137
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->FOLLOWS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    .line 138
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    goto :goto_0

    :cond_2
    move-object v2, v3

    :goto_0
    const/16 v4, 0x2a

    .line 142
    invoke-virtual {p0, v4}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 143
    new-instance v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;

    invoke-direct {v4, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;Ljava/lang/String;)V

    goto :goto_1

    .line 145
    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextIdentifier()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 147
    new-instance v5, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;

    invoke-direct {v5, v2, v4}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;Ljava/lang/String;)V

    .line 148
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedElement()V

    move-object v4, v5

    goto :goto_1

    :cond_4
    move-object v4, v3

    .line 152
    :goto_1
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v5

    if-nez v5, :cond_16

    const/16 v5, 0x2e

    .line 154
    invoke-virtual {p0, v5}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v5

    if-eqz v5, :cond_7

    if-nez v4, :cond_5

    .line 158
    new-instance v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;

    invoke-direct {v4, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;Ljava/lang/String;)V

    .line 159
    :cond_5
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextIdentifier()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_6

    .line 162
    const-string v6, "class"

    sget-object v7, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->EQUALS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    invoke-virtual {v4, v6, v7, v5}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->addAttrib(Ljava/lang/String;Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;Ljava/lang/String;)V

    .line 163
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    goto :goto_1

    .line 161
    :cond_6
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    const-string v0, "Invalid \".class\" simpleSelectors"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_7
    const/16 v5, 0x23

    .line 167
    invoke-virtual {p0, v5}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v5

    if-eqz v5, :cond_a

    if-nez v4, :cond_8

    .line 171
    new-instance v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;

    invoke-direct {v4, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;Ljava/lang/String;)V

    .line 172
    :cond_8
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextIdentifier()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_9

    .line 175
    const-string v6, "id"

    sget-object v7, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->EQUALS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    invoke-virtual {v4, v6, v7, v5}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->addAttrib(Ljava/lang/String;Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;Ljava/lang/String;)V

    .line 176
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedIdAttribute()V

    goto :goto_1

    .line 174
    :cond_9
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    const-string v0, "Invalid \"#id\" simpleSelectors"

    invoke-direct {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_a
    const/16 v5, 0x5b

    .line 181
    invoke-virtual {p0, v5}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v5

    if-eqz v5, :cond_14

    if-nez v4, :cond_b

    .line 184
    new-instance v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;

    invoke-direct {v4, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;Ljava/lang/String;)V

    .line 185
    :cond_b
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 186
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextIdentifier()Ljava/lang/String;

    move-result-object v5

    .line 188
    const-string v6, "Invalid attribute simpleSelectors"

    if-eqz v5, :cond_13

    .line 190
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    const/16 v7, 0x3d

    .line 192
    invoke-virtual {p0, v7}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 193
    sget-object v7, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->EQUALS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    goto :goto_2

    .line 194
    :cond_c
    const-string v7, "~="

    invoke-virtual {p0, v7}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 195
    sget-object v7, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->INCLUDES:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    goto :goto_2

    .line 196
    :cond_d
    const-string v7, "|="

    invoke-virtual {p0, v7}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 197
    sget-object v7, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->DASHMATCH:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    goto :goto_2

    :cond_e
    move-object v7, v3

    :goto_2
    if-eqz v7, :cond_10

    .line 199
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 200
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextAttribValue()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_f

    .line 203
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    goto :goto_3

    .line 202
    :cond_f
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    invoke-direct {p1, v6}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_10
    move-object v8, v3

    :goto_3
    const/16 v9, 0x5d

    .line 205
    invoke-virtual {p0, v9}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v9

    if-eqz v9, :cond_12

    if-nez v7, :cond_11

    .line 207
    sget-object v7, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->EXISTS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    :cond_11
    invoke-virtual {v4, v5, v7, v8}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->addAttrib(Ljava/lang/String;Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;Ljava/lang/String;)V

    .line 208
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->addedAttributeOrPseudo()V

    goto/16 :goto_1

    .line 206
    :cond_12
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    invoke-direct {p1, v6}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 189
    :cond_13
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;

    invoke-direct {p1, v6}, Lcom/flyersoft/components/androidsvg/utils/CSSParseException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_14
    const/16 v5, 0x3a

    .line 212
    invoke-virtual {p0, v5}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(C)Z

    move-result v5

    if-eqz v5, :cond_16

    if-nez v4, :cond_15

    .line 215
    new-instance v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;

    invoke-direct {v4, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;Ljava/lang/String;)V

    .line 216
    :cond_15
    invoke-direct {p0, p1, v4}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->parsePseudoClass(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;)V

    goto/16 :goto_1

    :cond_16
    if-eqz v4, :cond_17

    .line 225
    invoke-virtual {p1, v4}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->add(Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;)V

    const/4 p1, 0x1

    return p1

    .line 230
    :cond_17
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    return v1
.end method

.method public nextURL()Ljava/lang/String;
    .locals 4

    .line 614
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 616
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    .line 617
    const-string v2, "url("

    invoke-virtual {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    return-object v1

    .line 620
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 622
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextCSSString()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    .line 624
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->nextLegacyURL()Ljava/lang/String;

    move-result-object v2

    :cond_2
    if-nez v2, :cond_3

    .line 627
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    return-object v1

    .line 631
    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->skipWhitespace()V

    .line 633
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->empty()Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, ")"

    invoke-virtual {p0, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->consume(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_0

    .line 636
    :cond_4
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSTextScanner;->position:I

    return-object v1

    :cond_5
    :goto_0
    return-object v2
.end method
