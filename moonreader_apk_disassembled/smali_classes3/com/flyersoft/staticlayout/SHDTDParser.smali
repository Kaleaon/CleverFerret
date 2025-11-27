.class final Lcom/flyersoft/staticlayout/SHDTDParser;
.super Ljava/lang/Object;
.source "HyphenationXML.java"


# static fields
.field private static final COMMENT:B = 0x3t

.field private static final END_OF_COMMENT1:B = 0x4t

.field private static final END_OF_COMMENT2:B = 0x5t

.field private static final ENTITY:B = 0x6t

.field private static final IGNORABLE_WHITESPACE:B = 0x0t

.field private static final LANGLE:B = 0x1t

.field private static final NAME:B = 0x8t

.field private static final TAG_PREFIX:B = 0x2t

.field private static final VALUE:B = 0xat

.field private static final WAIT_END_OF_ENTITY:B = 0xbt

.field private static final WAIT_NAME:B = 0x7t

.field private static final WAIT_VALUE:B = 0x9t


# direct methods
.method constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doIt(Ljava/io/InputStream;Ljava/util/HashMap;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "[C>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p2

    .line 38
    new-instance v1, Ljava/io/InputStreamReader;

    const-string v2, "us-ascii"

    move-object/from16 v3, p1

    invoke-direct {v1, v3, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    const/16 v2, 0x2000

    .line 40
    new-array v2, v2, [C

    const/4 v3, 0x0

    .line 45
    const-string v4, ""

    move-object v6, v4

    move-object v7, v6

    const/4 v5, 0x0

    const/4 v8, 0x0

    .line 48
    :goto_0
    invoke-virtual {v1, v2}, Ljava/io/InputStreamReader;->read([C)I

    move-result v9

    if-gtz v9, :cond_0

    .line 50
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V

    return-void

    .line 53
    :cond_0
    array-length v10, v2

    if-ge v9, v10, :cond_1

    .line 54
    invoke-static {v2, v9, v9}, Lcom/flyersoft/staticlayout/SHArrayUtils;->createCopy([CII)[C

    move-result-object v2

    :cond_1
    const/4 v10, -0x1

    :goto_1
    const/16 v13, 0x3e

    const/4 v15, 0x2

    const/16 v12, 0x20

    const/4 v14, 0x1

    packed-switch v8, :pswitch_data_0

    goto :goto_1

    :goto_2
    :pswitch_0
    add-int/2addr v10, v14

    .line 200
    :try_start_0
    aget-char v11, v2, v10

    if-eq v11, v13, :cond_2

    goto :goto_2

    :cond_2
    :goto_3
    const/4 v8, 0x0

    goto :goto_1

    :goto_4
    :pswitch_1
    add-int/2addr v10, v14

    .line 152
    aget-char v11, v2, v10
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_2

    if-eq v11, v12, :cond_8

    if-eq v11, v13, :cond_3

    packed-switch v11, :pswitch_data_1

    goto :goto_4

    .line 155
    :cond_3
    :try_start_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v11, Ljava/lang/String;

    sub-int v12, v10, v5

    invoke-direct {v11, v2, v5, v12}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 156
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-le v8, v15, :cond_7

    .line 158
    invoke-virtual {v7, v3}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x22

    if-ne v11, v12, :cond_7

    add-int/lit8 v11, v8, -0x1

    .line 159
    invoke-virtual {v7, v11}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-ne v13, v12, :cond_7

    .line 160
    invoke-virtual {v7, v14, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 161
    const-string v11, "&#"

    invoke-virtual {v7, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_6

    const-string v11, ";"

    invoke-virtual {v7, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11
    :try_end_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_1

    if-eqz v11, :cond_6

    .line 164
    :try_start_2
    invoke-virtual {v7, v15}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x78

    if-ne v11, v12, :cond_4

    add-int/lit8 v8, v8, -0x3

    const/4 v11, 0x3

    .line 165
    invoke-virtual {v7, v11, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    const/16 v11, 0x10

    invoke-static {v8, v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v8

    goto :goto_6

    :cond_4
    const/4 v11, 0x0

    :goto_5
    add-int/lit8 v12, v8, -0x3

    if-ge v15, v12, :cond_5

    mul-int/lit8 v11, v11, 0xa

    .line 169
    invoke-virtual {v7, v15}, Ljava/lang/String;->charAt(I)C

    move-result v12

    add-int/lit8 v12, v12, -0x30

    add-int/2addr v11, v12

    add-int/lit8 v15, v15, 0x1

    goto :goto_5

    :cond_5
    move v8, v11

    :goto_6
    int-to-char v8, v8

    .line 172
    new-array v11, v14, [C

    aput-char v8, v11, v3

    invoke-virtual {v0, v6, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_7

    :catch_0
    nop

    goto :goto_7

    :cond_6
    add-int/lit8 v8, v8, -0x2

    .line 176
    :try_start_3
    new-array v11, v8, [C

    .line 177
    invoke-virtual {v7, v3, v8, v11, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 178
    invoke-virtual {v0, v6, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_1

    :cond_7
    :goto_7
    move-object v6, v4

    move-object v7, v6

    goto/16 :goto_3

    :catch_1
    nop

    const/4 v8, 0x0

    goto/16 :goto_e

    :cond_8
    :pswitch_2
    const/16 v8, 0xb

    .line 192
    :try_start_4
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v12, Ljava/lang/String;

    sub-int v13, v10, v5

    invoke-direct {v12, v2, v5, v13}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v6, v4

    move-object v7, v6

    goto/16 :goto_1

    :cond_9
    :pswitch_3
    add-int/2addr v10, v14

    .line 135
    aget-char v11, v2, v10

    if-eq v11, v12, :cond_9

    packed-switch v11, :pswitch_data_2

    move v5, v10

    const/16 v8, 0xa

    goto/16 :goto_1

    :goto_8
    :pswitch_4
    add-int/2addr v10, v14

    .line 120
    aget-char v11, v2, v10

    if-eq v11, v12, :cond_a

    packed-switch v11, :pswitch_data_3

    goto :goto_8

    :cond_a
    :pswitch_5
    const/16 v8, 0x9

    .line 129
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v12, Ljava/lang/String;

    sub-int v13, v10, v5

    invoke-direct {v12, v2, v5, v13}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    :cond_b
    :pswitch_6
    add-int/2addr v10, v14

    .line 103
    aget-char v11, v2, v10

    if-eq v11, v12, :cond_b

    packed-switch v11, :pswitch_data_4

    move v5, v10

    const/16 v8, 0x8

    goto/16 :goto_1

    :goto_9
    :pswitch_7
    add-int/2addr v10, v14

    .line 89
    aget-char v11, v2, v10

    if-eq v11, v12, :cond_c

    packed-switch v11, :pswitch_data_5

    goto :goto_9

    :cond_c
    :pswitch_8
    const/4 v8, 0x7

    goto/16 :goto_1

    :pswitch_9
    const/4 v11, 0x3

    add-int/lit8 v10, v10, 0x1

    .line 224
    aget-char v8, v2, v10

    if-eq v8, v13, :cond_2

    goto :goto_b

    :pswitch_a
    const/4 v11, 0x3

    add-int/lit8 v10, v10, 0x1

    .line 215
    aget-char v8, v2, v10

    const/16 v12, 0x2d

    if-eq v8, v12, :cond_d

    goto :goto_b

    :cond_d
    const/4 v8, 0x5

    goto/16 :goto_1

    :pswitch_b
    const/16 v12, 0x2d

    :goto_a
    add-int/2addr v10, v14

    .line 208
    aget-char v11, v2, v10

    if-eq v11, v12, :cond_e

    goto :goto_a

    :cond_e
    const/4 v8, 0x4

    goto/16 :goto_1

    :pswitch_c
    const/4 v11, 0x3

    const/16 v12, 0x2d

    add-int/lit8 v10, v10, 0x1

    .line 77
    aget-char v8, v2, v10

    if-eq v8, v12, :cond_10

    const/16 v11, 0x45

    if-eq v8, v11, :cond_f

    goto :goto_c

    :cond_f
    const/4 v8, 0x6

    goto/16 :goto_1

    :cond_10
    :goto_b
    const/4 v8, 0x3

    goto/16 :goto_1

    :pswitch_d
    add-int/lit8 v10, v10, 0x1

    .line 69
    aget-char v8, v2, v10
    :try_end_4
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_4 .. :try_end_4} :catch_2

    const/16 v11, 0x21

    if-eq v8, v11, :cond_11

    .line 247
    :goto_c
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V

    return-void

    :cond_11
    const/4 v8, 0x2

    goto/16 :goto_1

    :goto_d
    :pswitch_e
    add-int/2addr v10, v14

    .line 62
    :try_start_5
    aget-char v11, v2, v10
    :try_end_5
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_5 .. :try_end_5} :catch_2

    const/16 v12, 0x3c

    if-eq v11, v12, :cond_12

    goto :goto_d

    :cond_12
    const/4 v8, 0x1

    goto/16 :goto_1

    :catch_2
    nop

    :goto_e
    const/16 v10, 0x8

    if-eq v8, v10, :cond_14

    const/16 v10, 0xa

    if-eq v8, v10, :cond_13

    goto/16 :goto_0

    .line 241
    :cond_13
    new-instance v7, Ljava/lang/String;

    sub-int/2addr v9, v5

    invoke-direct {v7, v2, v5, v9}, Ljava/lang/String;-><init>([CII)V

    goto :goto_f

    .line 237
    :cond_14
    new-instance v6, Ljava/lang/String;

    sub-int/2addr v9, v5

    invoke-direct {v6, v2, v5, v9}, Ljava/lang/String;-><init>([CII)V

    :goto_f
    const/4 v5, 0x0

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_7
        :pswitch_6
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x8
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x8
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x8
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x8
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x8
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
    .end packed-switch
.end method
