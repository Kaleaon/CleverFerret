.class Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;
.super Ljava/lang/Object;
.source "CSSParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/CSSParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Selector"
.end annotation


# instance fields
.field simpleSelectors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;",
            ">;"
        }
    .end annotation
.end field

.field specificity:I


# direct methods
.method constructor <init>()V
    .locals 1

    .line 325
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 327
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->simpleSelectors:Ljava/util/List;

    const/4 v0, 0x0

    .line 328
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->specificity:I

    return-void
.end method


# virtual methods
.method add(Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;)V
    .locals 1

    .line 332
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->simpleSelectors:Ljava/util/List;

    if-nez v0, :cond_0

    .line 333
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->simpleSelectors:Ljava/util/List;

    .line 334
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->simpleSelectors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method addedAttributeOrPseudo()V
    .locals 1

    .line 363
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->specificity:I

    add-int/lit16 v0, v0, 0x3e8

    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->specificity:I

    return-void
.end method

.method addedElement()V
    .locals 1

    .line 369
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->specificity:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->specificity:I

    return-void
.end method

.method addedIdAttribute()V
    .locals 2

    .line 357
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->specificity:I

    const v1, 0xf4240

    add-int/2addr v0, v1

    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->specificity:I

    return-void
.end method

.method get(I)Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;
    .locals 1

    .line 344
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->simpleSelectors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;

    return-object p1
.end method

.method isEmpty()Z
    .locals 1

    .line 350
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->simpleSelectors:Ljava/util/List;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method size()I
    .locals 1

    .line 339
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->simpleSelectors:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 375
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 376
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->simpleSelectors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;

    .line 377
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const/16 v1, 0x5b

    .line 378
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Selector;->specificity:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
