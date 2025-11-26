.class public Lcom/flyersoft/staticlayout/MyHtml;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;,
        Lcom/flyersoft/staticlayout/MyHtml$HtmlParser;,
        Lcom/flyersoft/staticlayout/MyHtml$TagHandler;,
        Lcom/flyersoft/staticlayout/MyHtml$StyleMap;,
        Lcom/flyersoft/staticlayout/MyHtml$TagClassValueComparable;,
        Lcom/flyersoft/staticlayout/MyHtml$Emphasis;,
        Lcom/flyersoft/staticlayout/MyHtml$Ruby;
    }
.end annotation


# static fields
.field public static final HR_TAG:Ljava/lang/String; = "\u2500\u2500\u2500"

.field public static LI_TAG:Ljava/lang/String; = "\u2022\u3000"

.field public static final PAGE_BREAK:Ljava/lang/String; = "<hr2>"

.field static cacheStylesCount:I

.field public static cssFonts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static familyBold:Ljava/lang/String;

.field public static familyBoldItalic:Ljava/lang/String;

.field public static familyItalic:Ljava/lang/String;

.field public static isFb2:Z

.field static tagCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static appendStyle(Lcom/flyersoft/components/CSS$Style;Lcom/flyersoft/components/CSS$Style;)Lcom/flyersoft/components/CSS$Style;
    .locals 1

    if-nez p0, :cond_0

    return-object p1

    :cond_0
    if-nez p1, :cond_1

    return-object p0

    .line 528
    :cond_1
    new-instance v0, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/CSS$Style;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    .line 529
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/CSS$Style;->combineStyle(Lcom/flyersoft/components/CSS$Style;)V

    return-object v0
.end method

.method public static fromHtml(Ljava/lang/String;)Landroid/text/Spanned;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, -0x1

    .line 143
    invoke-static {p0, v0, v1}, Lcom/flyersoft/staticlayout/MyHtml;->fromHtml(Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;I)Landroid/text/Spanned;

    move-result-object p0

    return-object p0
.end method

.method public static fromHtml(Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;I)Landroid/text/Spanned;
    .locals 1

    const/4 v0, 0x0

    .line 174
    invoke-static {p0, p1, v0, p2}, Lcom/flyersoft/staticlayout/MyHtml;->fromHtml(Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;Lcom/flyersoft/staticlayout/MyHtml$TagHandler;I)Landroid/text/Spanned;

    move-result-object p0

    return-object p0
.end method

.method public static fromHtml(Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;Lcom/flyersoft/staticlayout/MyHtml$TagHandler;I)Landroid/text/Spanned;
    .locals 8

    .line 150
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    instance-of v0, v0, Lcom/flyersoft/books/Fb2;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/flyersoft/staticlayout/MyHtml;->isFb2:Z

    .line 151
    new-instance v6, Lorg/ccil/cowan/tagsoup/Parser;

    invoke-direct {v6}, Lorg/ccil/cowan/tagsoup/Parser;-><init>()V

    .line 153
    :try_start_0
    const-string v0, "http://www.ccil.org/~cowan/tagsoup/properties/schema"

    invoke-static {}, Lcom/flyersoft/staticlayout/MyHtml$HtmlParser;->-$$Nest$sfgetschema()Lorg/ccil/cowan/tagsoup/HTMLSchema;

    move-result-object v2

    invoke-virtual {v6, v0, v2}, Lorg/ccil/cowan/tagsoup/Parser;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXNotRecognizedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xml/sax/SAXNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    sput v1, Lcom/flyersoft/staticlayout/MyHtml;->cacheStylesCount:I

    sput v1, Lcom/flyersoft/staticlayout/MyHtml;->tagCount:I

    .line 163
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 164
    new-instance v2, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move v7, p3

    invoke-direct/range {v2 .. v7}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;-><init>(Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;Lcom/flyersoft/staticlayout/MyHtml$TagHandler;Lorg/ccil/cowan/tagsoup/Parser;I)V

    .line 165
    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;->convert()Landroid/text/Spanned;

    move-result-object p0

    return-object p0

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 159
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception v0

    move-object p0, v0

    .line 156
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static getClassStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/books/BaseEBook$Chapter;Ljava/util/ArrayList;Ljava/util/ArrayList;)Lcom/flyersoft/components/CSS$Style;
    .locals 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/flyersoft/components/CSS$Style;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-object/from16 v6, p2

    move-object/from16 v5, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    const/4 v7, 0x0

    if-nez v5, :cond_0

    return-object v7

    .line 181
    :cond_0
    iget-object v8, v5, Lcom/flyersoft/books/BaseEBook$Chapter;->css:Lcom/flyersoft/components/CSS;

    if-eqz v8, :cond_20

    .line 182
    iget-object v2, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    if-nez v2, :cond_1

    goto/16 :goto_11

    :cond_1
    if-eqz v0, :cond_2

    .line 185
    iget-object v2, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "#"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/CSS$Style;

    move-object v9, v2

    goto :goto_0

    :cond_2
    move-object v9, v7

    :goto_0
    if-nez v9, :cond_3

    move-object v0, v7

    .line 186
    :cond_3
    invoke-static {v3, v4, v1, v6, v0}, Lcom/flyersoft/staticlayout/MyHtml;->getSecCacheName(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    .line 187
    iget-object v0, v8, Lcom/flyersoft/components/CSS;->cacheStyles:Ljava/util/HashMap;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 188
    new-instance v0, Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v8, Lcom/flyersoft/components/CSS;->cacheStyles:Ljava/util/HashMap;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/CSS$Style;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    return-object v0

    .line 191
    :cond_4
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    const/4 v12, 0x0

    const/4 v13, 0x1

    if-eqz v3, :cond_6

    .line 192
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gt v0, v13, :cond_5

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v0, v13, :cond_6

    invoke-virtual {v3, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    :cond_5
    const/4 v14, 0x1

    goto :goto_1

    :cond_6
    const/4 v14, 0x0

    .line 194
    :goto_1
    const-string v15, " "

    if-eqz v14, :cond_8

    .line 195
    iget-object v0, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_2
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 196
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    const/4 v2, 0x0

    .line 197
    invoke-static/range {v0 .. v5}, Lcom/flyersoft/staticlayout/MyHtml;->secFitPriorTags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/flyersoft/books/BaseEBook$Chapter;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 198
    new-instance v2, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    invoke-direct {v2, v12, v12, v0}, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;-><init>(IZLjava/lang/String;)V

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7
    move-object/from16 v5, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    goto :goto_2

    .line 200
    :cond_8
    iget-object v0, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "body "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 201
    new-instance v0, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v12, v12, v2}, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;-><init>(IZLjava/lang/String;)V

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_9
    if-eqz v6, :cond_19

    .line 205
    const-string v0, " +"

    invoke-virtual {v6, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 206
    array-length v2, v0

    move-object v4, v7

    const/4 v3, 0x0

    :goto_3
    if-ge v3, v2, :cond_11

    move v5, v2

    aget-object v2, v0, v3

    .line 207
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v16

    if-lez v16, :cond_10

    .line 208
    iget-object v7, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "."

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v7, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/components/CSS$Style;

    invoke-static {v4, v7}, Lcom/flyersoft/staticlayout/MyHtml;->appendStyle(Lcom/flyersoft/components/CSS$Style;Lcom/flyersoft/components/CSS$Style;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v7

    .line 209
    iget-object v4, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 210
    new-instance v4, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v18, v0

    const/16 v0, 0xa

    move/from16 v19, v3

    const/4 v3, 0x1

    invoke-direct {v4, v0, v3, v12}, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;-><init>(IZLjava/lang/String;)V

    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_a
    move-object/from16 v18, v0

    move/from16 v19, v3

    :goto_4
    if-eqz v14, :cond_f

    .line 213
    iget-object v0, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_5
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 214
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v20

    if-nez v20, :cond_c

    .line 215
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, " ."

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b

    goto :goto_6

    :cond_b
    move-object/from16 v21, v7

    move-object/from16 v7, v18

    move/from16 v18, v5

    goto :goto_8

    :cond_c
    :goto_6
    move-object/from16 v3, p4

    move-object/from16 v4, p5

    move-object/from16 v21, v7

    move-object/from16 v7, v18

    move/from16 v18, v5

    move-object/from16 v5, p3

    .line 216
    invoke-static/range {v0 .. v5}, Lcom/flyersoft/staticlayout/MyHtml;->secFitPriorTags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/flyersoft/books/BaseEBook$Chapter;)Z

    move-result v22

    if-eqz v22, :cond_e

    .line 217
    new-instance v3, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    if-eqz v20, :cond_d

    const/16 v4, 0xb

    goto :goto_7

    :cond_d
    const/4 v4, 0x1

    :goto_7
    const/4 v5, 0x0

    invoke-direct {v3, v4, v5, v0}, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;-><init>(IZLjava/lang/String;)V

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_e
    :goto_8
    move/from16 v5, v18

    move-object/from16 v18, v7

    move-object/from16 v7, v21

    goto :goto_5

    :cond_f
    move-object/from16 v21, v7

    move-object/from16 v7, v18

    move/from16 v18, v5

    move-object/from16 v4, v21

    goto :goto_9

    :cond_10
    move-object v7, v0

    move/from16 v19, v3

    move/from16 v18, v5

    :goto_9
    add-int/lit8 v3, v19, 0x1

    move-object v0, v7

    move/from16 v2, v18

    const/4 v7, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    goto/16 :goto_3

    :cond_11
    move-object v7, v0

    .line 221
    array-length v0, v7

    const/4 v3, 0x1

    if-le v0, v3, :cond_18

    .line 222
    invoke-static {v7}, Lcom/flyersoft/staticlayout/MyHtml;->getWholeClassName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 223
    iget-object v0, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 224
    new-instance v0, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    const/16 v5, 0x14

    invoke-direct {v0, v5, v3, v2}, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;-><init>(IZLjava/lang/String;)V

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 225
    :cond_12
    iget-object v0, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 226
    new-instance v0, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x1e

    const/4 v7, 0x1

    invoke-direct {v0, v5, v7, v3}, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;-><init>(IZLjava/lang/String;)V

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_13
    if-eqz v14, :cond_18

    .line 229
    iget-object v0, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_a
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 230
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_15

    .line 231
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_14

    goto :goto_b

    :cond_14
    move-object/from16 v3, p4

    move-object v13, v4

    move-object/from16 v4, p5

    goto :goto_d

    :cond_15
    :goto_b
    move-object/from16 v5, p3

    move-object/from16 v3, p4

    move-object v13, v4

    move-object/from16 v4, p5

    .line 232
    invoke-static/range {v0 .. v5}, Lcom/flyersoft/staticlayout/MyHtml;->secFitPriorTags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/flyersoft/books/BaseEBook$Chapter;)Z

    move-result v14

    if-eqz v14, :cond_17

    .line 233
    new-instance v5, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    if-eqz v12, :cond_16

    const/16 v12, 0x1f

    goto :goto_c

    :cond_16
    const/16 v12, 0x15

    :goto_c
    const/4 v14, 0x0

    invoke-direct {v5, v12, v14, v0}, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;-><init>(IZLjava/lang/String;)V

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_17
    :goto_d
    move-object v4, v13

    goto :goto_a

    :cond_18
    move-object/from16 v3, p4

    move-object v13, v4

    move-object/from16 v4, p5

    goto :goto_e

    :cond_19
    move-object/from16 v3, p4

    move-object/from16 v4, p5

    const/4 v13, 0x0

    .line 238
    :goto_e
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v7, 0x1

    if-le v0, v7, :cond_1c

    const/4 v5, 0x0

    .line 239
    :goto_f
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v5, v0, :cond_1b

    .line 240
    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    iget-boolean v0, v0, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;->basic:Z

    if-nez v0, :cond_1a

    .line 241
    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    iget v2, v0, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;->value:I

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    iget-object v7, v7, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;->section:Ljava/lang/String;

    invoke-static {v7, v1, v6, v3, v4}, Lcom/flyersoft/staticlayout/MyHtml;->getTagClassValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)I

    move-result v7

    add-int/2addr v2, v7

    iput v2, v0, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;->value:I

    :cond_1a
    add-int/lit8 v5, v5, 0x1

    goto :goto_f

    .line 244
    :cond_1b
    new-instance v0, Lcom/flyersoft/staticlayout/MyHtml$TagClassValueComparable;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lcom/flyersoft/staticlayout/MyHtml$TagClassValueComparable;-><init>(Lcom/flyersoft/staticlayout/MyHtml-IA;)V

    invoke-static {v11, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const/4 v12, 0x0

    .line 245
    :goto_10
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v12, v0, :cond_1d

    .line 246
    iget-object v0, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    iget-object v2, v2, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;->section:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/CSS$Style;

    invoke-static {v13, v0}, Lcom/flyersoft/staticlayout/MyHtml;->appendStyle(Lcom/flyersoft/components/CSS$Style;Lcom/flyersoft/components/CSS$Style;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v13

    add-int/lit8 v12, v12, 0x1

    goto :goto_10

    .line 248
    :cond_1c
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_1d

    .line 249
    iget-object v0, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    const/4 v14, 0x0

    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;

    iget-object v2, v2, Lcom/flyersoft/staticlayout/MyHtml$StyleMap;->section:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/CSS$Style;

    invoke-static {v13, v0}, Lcom/flyersoft/staticlayout/MyHtml;->appendStyle(Lcom/flyersoft/components/CSS$Style;Lcom/flyersoft/components/CSS$Style;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v13

    .line 251
    :cond_1d
    iget-object v0, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/CSS$Style;

    invoke-static {v0, v13}, Lcom/flyersoft/staticlayout/MyHtml;->appendStyle(Lcom/flyersoft/components/CSS$Style;Lcom/flyersoft/components/CSS$Style;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v0

    if-eqz v0, :cond_1e

    .line 252
    iget-object v2, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    const-string v3, "*"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 253
    iget-object v2, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/CSS$Style;

    invoke-static {v2, v0}, Lcom/flyersoft/staticlayout/MyHtml;->appendStyle(Lcom/flyersoft/components/CSS$Style;Lcom/flyersoft/components/CSS$Style;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v0

    .line 254
    :cond_1e
    invoke-static {v0, v9}, Lcom/flyersoft/staticlayout/MyHtml;->appendStyle(Lcom/flyersoft/components/CSS$Style;Lcom/flyersoft/components/CSS$Style;)Lcom/flyersoft/components/CSS$Style;

    move-result-object v0

    if-eqz v0, :cond_1f

    .line 256
    iget-object v2, v8, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->containsValue(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1f

    .line 257
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "@"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/components/CSS$Style;->name:Ljava/lang/String;

    .line 258
    :cond_1f
    iget-object v1, v8, Lcom/flyersoft/components/CSS;->cacheStyles:Ljava/util/HashMap;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    sget v1, Lcom/flyersoft/staticlayout/MyHtml;->cacheStylesCount:I

    const/16 v17, 0x1

    add-int/lit8 v1, v1, 0x1

    sput v1, Lcom/flyersoft/staticlayout/MyHtml;->cacheStylesCount:I

    .line 261
    new-instance v1, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v1, v0}, Lcom/flyersoft/components/CSS$Style;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    return-object v1

    :cond_20
    :goto_11
    move-object/from16 v16, v7

    return-object v16
.end method

.method public static getCssFontList(I)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 103
    sget-object v0, Lcom/flyersoft/staticlayout/MyHtml;->cssFonts:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 104
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/flyersoft/staticlayout/MyHtml;->cssFonts:Ljava/util/Map;

    .line 105
    :cond_0
    sget-object v0, Lcom/flyersoft/staticlayout/MyHtml;->cssFonts:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 107
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 108
    sget-object v1, Lcom/flyersoft/staticlayout/MyHtml;->cssFonts:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object v0
.end method

.method private static getPreTagName(Ljava/lang/String;I)Ljava/lang/String;
    .locals 4

    const/16 v0, 0x20

    .line 460
    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->lastIndexOf(II)I

    move-result p1

    if-lez p1, :cond_2

    add-int/lit8 v1, p1, -0x1

    .line 462
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    add-int/2addr v0, v3

    :goto_0
    if-le p1, v0, :cond_2

    .line 465
    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 466
    const-string v1, ">"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 467
    invoke-static {p0, v0}, Lcom/flyersoft/staticlayout/MyHtml;->getPreTagName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 469
    :cond_1
    invoke-static {p1, v2, v3}, Lcom/flyersoft/components/CSS;->nextSplit(Ljava/lang/String;IZ)I

    move-result p0

    .line 470
    invoke-virtual {p1, v2, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getSecCacheName(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .line 266
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    if-eqz p3, :cond_0

    .line 268
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    move-result p3

    mul-int/lit8 p3, p3, 0x7b

    add-int/2addr v0, p3

    :cond_0
    if-eqz p4, :cond_1

    .line 270
    invoke-virtual {p4}, Ljava/lang/String;->hashCode()I

    move-result p3

    add-int/2addr v0, p3

    :cond_1
    if-eqz p0, :cond_3

    .line 273
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-lez p3, :cond_3

    .line 274
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p3

    add-int/lit8 p4, p3, -0x1

    .line 275
    invoke-virtual {p0, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-le p3, p2, :cond_2

    sub-int/2addr p4, p2

    .line 277
    invoke-virtual {p0, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    mul-int v1, v1, p3

    add-int/2addr v0, v1

    .line 278
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 279
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    invoke-virtual {p4}, Ljava/lang/String;->hashCode()I

    move-result p4

    add-int/2addr v0, p4

    :cond_2
    add-int/lit8 p2, p2, 0x1

    if-le p3, p2, :cond_3

    const/4 p2, 0x0

    .line 282
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr v0, p0

    .line 283
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_3

    .line 284
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr v0, p0

    :cond_3
    return v0
.end method

.method private static getTagClassValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)I
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    const/4 p1, 0x0

    const/4 p2, 0x0

    const/4 v0, 0x0

    .line 481
    :goto_0
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    if-ge p2, v1, :cond_7

    .line 482
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 483
    invoke-virtual {p4, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    const-string v4, " "

    if-eqz v3, :cond_5

    .line 485
    invoke-virtual {p4, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v5, " +"

    invoke-virtual {v3, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 486
    array-length v5, v3

    if-le v5, v2, :cond_1

    .line 487
    invoke-static {v3}, Lcom/flyersoft/staticlayout/MyHtml;->getWholeClassName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 488
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    add-int/lit8 v2, p2, 0x3

    :goto_1
    add-int/2addr v2, v0

    goto :goto_2

    .line 490
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    add-int/lit8 v2, p2, 0x2

    goto :goto_1

    :cond_1
    move v2, v0

    :goto_2
    if-ne v0, v2, :cond_4

    .line 494
    array-length v0, v3

    const/4 v5, 0x0

    :goto_3
    if-ge v5, v0, :cond_4

    aget-object v6, v3, v5

    .line 495
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_3

    .line 496
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_2

    add-int/lit8 v6, p2, 0x1

    add-int/2addr v2, v6

    goto :goto_4

    .line 498
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3

    add-int/2addr v2, p2

    :cond_3
    :goto_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_4
    move v0, v2

    goto :goto_5

    .line 500
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6

    add-int/2addr v0, p2

    :cond_6
    :goto_5
    add-int/lit8 p2, p2, 0x1

    goto/16 :goto_0

    :cond_7
    return v0
.end method

.method private static getWholeClassName([Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 291
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 292
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 293
    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 294
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "."

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v3, p0, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 295
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static initFamilyFontParams()V
    .locals 8

    const/4 v0, 0x0

    .line 64
    sput-object v0, Lcom/flyersoft/staticlayout/MyHtml;->familyBoldItalic:Ljava/lang/String;

    sput-object v0, Lcom/flyersoft/staticlayout/MyHtml;->familyItalic:Ljava/lang/String;

    sput-object v0, Lcom/flyersoft/staticlayout/MyHtml;->familyBold:Ljava/lang/String;

    .line 65
    sget-object v1, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 66
    sget-object v2, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 67
    const-string v3, "sans-serif"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_0

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 68
    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 70
    :cond_0
    sget-object v3, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    const-string v5, "/"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 71
    sget-object v0, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 72
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ".ttf"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    .line 74
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/flyersoft/tools/A;->SYSTEM_FONT_PATH:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v7, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/flyersoft/tools/A;->SYSTEM_FONT_PATH:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v7, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 75
    :cond_3
    sget-object v0, Lcom/flyersoft/tools/A;->SYSTEM_FONT_PATH:Ljava/lang/String;

    goto :goto_1

    .line 73
    :cond_4
    :goto_0
    sget-object v0, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    :cond_5
    :goto_1
    if-eqz v0, :cond_8

    .line 77
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "-Bold"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 78
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/flyersoft/staticlayout/MyHtml;->familyBold:Ljava/lang/String;

    .line 79
    :cond_6
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "-Italic"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 80
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/flyersoft/staticlayout/MyHtml;->familyItalic:Ljava/lang/String;

    .line 81
    :cond_7
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "-BoldItalic"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 82
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/staticlayout/MyHtml;->familyBoldItalic:Ljava/lang/String;

    .line 84
    :cond_8
    sget-boolean v0, Lcom/flyersoft/tools/A;->useCssFont:Z

    if-eqz v0, :cond_b

    sget-object v0, Lcom/flyersoft/tools/A;->forceCssFontName:Ljava/lang/String;

    if-eqz v0, :cond_b

    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_b

    .line 85
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget-object v1, Lcom/flyersoft/tools/A;->forceCssFontName:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Lcom/flyersoft/books/BaseEBook;->getFontFile(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 86
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_b

    const/4 v1, 0x1

    .line 87
    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->fontInEpubIgnored(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_b

    .line 88
    sget-object v2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget-object v3, Lcom/flyersoft/tools/A;->forceCssFontName:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lcom/flyersoft/books/BaseEBook;->getFontFile(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 89
    sget-object v2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget-object v3, Lcom/flyersoft/tools/A;->forceCssFontName:Ljava/lang/String;

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v4}, Lcom/flyersoft/books/BaseEBook;->getFontFile(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    .line 90
    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget-object v4, Lcom/flyersoft/tools/A;->forceCssFontName:Ljava/lang/String;

    const/4 v5, 0x3

    invoke-virtual {v3, v4, v5}, Lcom/flyersoft/books/BaseEBook;->getFontFile(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    .line 92
    sput-object v1, Lcom/flyersoft/staticlayout/MyHtml;->familyBold:Ljava/lang/String;

    .line 93
    :cond_9
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 94
    sput-object v2, Lcom/flyersoft/staticlayout/MyHtml;->familyItalic:Ljava/lang/String;

    .line 95
    :cond_a
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 96
    sput-object v3, Lcom/flyersoft/staticlayout/MyHtml;->familyBoldItalic:Ljava/lang/String;

    :cond_b
    return-void
.end method

.method private static nextEqualsTagClass(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    .line 448
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    if-eqz p2, :cond_3

    .line 451
    const-string v0, "."

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 452
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 453
    :cond_1
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    :cond_2
    return v1

    :cond_3
    const/4 p0, 0x0

    return p0
.end method

.method private static secFitPriorTags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/flyersoft/books/BaseEBook$Chapter;)Z
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ")Z"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v1, p5

    .line 300
    const-string v3, "html"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const-string v8, "."

    const/16 v9, 0x20

    const-string v10, " "

    const/4 v11, 0x1

    if-nez v3, :cond_0

    const-string v3, "body"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css_body_class:Ljava/lang/String;

    if-eqz v3, :cond_1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->css_body_class:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 301
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 302
    :cond_0
    invoke-virtual {v0, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/2addr v1, v11

    .line 303
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 304
    invoke-virtual {v0, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    move-object/from16 v3, p2

    .line 305
    invoke-static {v0, v2, v3}, Lcom/flyersoft/staticlayout/MyHtml;->nextEqualsTagClass(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0

    :cond_1
    move-object/from16 v3, p2

    move-object v1, v0

    .line 308
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v4, v0, -0x1

    .line 309
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    add-int/lit8 v4, v0, -0x2

    :cond_2
    move v5, v4

    const/4 v12, 0x0

    const/4 v4, 0x0

    :goto_0
    if-gt v4, v5, :cond_d

    .line 312
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Ljava/lang/String;

    .line 313
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 315
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v14, " +"

    invoke-virtual {v0, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    .line 316
    array-length v0, v14

    if-le v0, v11, :cond_5

    .line 317
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v14}, Lcom/flyersoft/staticlayout/MyHtml;->getWholeClassName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 318
    invoke-static/range {v0 .. v7}, Lcom/flyersoft/staticlayout/MyHtml;->step2Fit(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_3

    return v11

    .line 321
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v14}, Lcom/flyersoft/staticlayout/MyHtml;->getWholeClassName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_4

    if-lez v0, :cond_5

    add-int/lit8 v2, v0, -0x1

    .line 322
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v9, :cond_5

    :cond_4
    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    .line 323
    invoke-static/range {v0 .. v7}, Lcom/flyersoft/staticlayout/MyHtml;->step2Fit(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_5

    return v11

    .line 327
    :cond_5
    array-length v15, v14

    const/4 v0, 0x0

    :goto_1
    if-ge v0, v15, :cond_a

    aget-object v2, v14, v0

    .line 328
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_8

    .line 329
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move/from16 v16, v0

    move-object v11, v2

    move v0, v3

    const/16 v17, 0x1

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    .line 330
    invoke-static/range {v0 .. v7}, Lcom/flyersoft/staticlayout/MyHtml;->step2Fit(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_6

    return v17

    .line 333
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_7

    if-lez v0, :cond_9

    add-int/lit8 v2, v0, -0x1

    .line 334
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v9, :cond_9

    :cond_7
    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    .line 335
    invoke-static/range {v0 .. v7}, Lcom/flyersoft/staticlayout/MyHtml;->step2Fit(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_9

    return v17

    :cond_8
    move/from16 v16, v0

    const/16 v17, 0x1

    :cond_9
    add-int/lit8 v0, v16, 0x1

    const/4 v11, 0x1

    goto :goto_1

    :cond_a
    const/16 v17, 0x1

    .line 340
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_b

    if-lez v0, :cond_c

    add-int/lit8 v2, v0, -0x1

    .line 341
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v9, :cond_c

    :cond_b
    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    .line 342
    invoke-static/range {v0 .. v7}, Lcom/flyersoft/staticlayout/MyHtml;->step2Fit(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_c

    return v17

    :cond_c
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    const/4 v11, 0x1

    goto/16 :goto_0

    :cond_d
    return v12
.end method

.method private static step2Fit(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/util/ArrayList;Ljava/util/ArrayList;)Z
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    move/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p4

    move/from16 v4, p5

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    const/4 v7, 0x0

    const/4 v8, -0x1

    if-ne v0, v8, :cond_0

    return v7

    .line 356
    :cond_0
    const-string v9, " +"

    const/4 v10, 0x1

    if-eqz v0, :cond_d

    if-nez v3, :cond_1

    return v7

    .line 362
    :cond_1
    invoke-static {v1, v0}, Lcom/flyersoft/staticlayout/MyHtml;->getPreTagName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_c

    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_0
    if-ge v12, v3, :cond_b

    .line 366
    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 368
    invoke-virtual {v6, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_9

    .line 369
    invoke-virtual {v11, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_2

    const/4 v13, 0x1

    goto/16 :goto_4

    .line 374
    :cond_2
    invoke-virtual {v6, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v15, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    .line 375
    array-length v7, v15

    if-le v7, v10, :cond_4

    .line 376
    invoke-static {v15}, Lcom/flyersoft/staticlayout/MyHtml;->getWholeClassName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 377
    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_3

    const/16 v17, 0x1

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    goto :goto_3

    :cond_3
    const/16 v17, 0x1

    goto :goto_3

    :cond_4
    const/16 v17, 0x1

    .line 383
    :cond_5
    array-length v7, v15

    const/4 v10, 0x0

    :goto_1
    if-ge v10, v7, :cond_8

    aget-object v8, v15, v10

    move/from16 v18, v7

    .line 384
    new-instance v7, Ljava/lang/StringBuilder;

    move/from16 v19, v10

    const-string v10, "."

    invoke-direct {v7, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_7

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    goto :goto_2

    :cond_6
    add-int/lit8 v10, v19, 0x1

    move/from16 v7, v18

    const/4 v8, -0x1

    goto :goto_1

    :cond_7
    :goto_2
    const/4 v13, 0x1

    :cond_8
    if-eqz v13, :cond_a

    goto :goto_5

    :cond_9
    const/16 v16, 0x0

    const/16 v17, 0x1

    .line 392
    invoke-virtual {v11, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    :goto_3
    const/4 v13, 0x1

    goto :goto_5

    :cond_a
    add-int/lit8 v12, v12, 0x1

    const/4 v7, 0x0

    const/4 v8, -0x1

    const/4 v10, 0x1

    goto/16 :goto_0

    :cond_b
    :goto_4
    const/16 v16, 0x0

    const/16 v17, 0x1

    goto :goto_5

    :cond_c
    const/16 v16, 0x0

    const/16 v17, 0x1

    const/4 v13, 0x0

    :goto_5
    if-nez v13, :cond_e

    return v16

    :cond_d
    const/16 v16, 0x0

    const/16 v17, 0x1

    .line 405
    :cond_e
    const-string v7, ">"

    if-ne v3, v4, :cond_f

    .line 406
    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v10, -0x1

    if-eq v8, v10, :cond_f

    add-int/lit8 v8, v8, 0x1

    .line 408
    invoke-virtual {v1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 409
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    :cond_f
    const/16 v8, 0x20

    .line 414
    invoke-virtual {v1, v8, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 415
    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 416
    :goto_6
    const-string v8, " "

    invoke-virtual {v0, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_10

    const/4 v10, 0x1

    .line 417
    invoke-virtual {v0, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const/16 v17, 0x1

    goto :goto_6

    :cond_10
    const/4 v10, 0x1

    .line 418
    invoke-virtual {v0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_11

    .line 419
    invoke-virtual {v1, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 420
    :goto_7
    invoke-virtual {v0, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 421
    invoke-virtual {v0, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_11
    move-object/from16 v1, p3

    .line 424
    invoke-static {v0, v2, v1}, Lcom/flyersoft/staticlayout/MyHtml;->nextEqualsTagClass(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_12

    return v10

    :cond_12
    if-ne v3, v4, :cond_13

    return v16

    :cond_13
    const/4 v1, 0x0

    .line 432
    invoke-static {v0, v1, v10}, Lcom/flyersoft/components/CSS;->nextSplit(Ljava/lang/String;IZ)I

    move-result v2

    .line 433
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v1, v3, 0x1

    .line 435
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 436
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_15

    .line 437
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 438
    invoke-static {v1}, Lcom/flyersoft/staticlayout/MyHtml;->getWholeClassName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 439
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_14

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_14
    const/16 v17, 0x1

    return v17

    :cond_15
    const/16 v17, 0x1

    .line 441
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    return v17

    :cond_16
    const/16 v16, 0x0

    return v16
.end method
