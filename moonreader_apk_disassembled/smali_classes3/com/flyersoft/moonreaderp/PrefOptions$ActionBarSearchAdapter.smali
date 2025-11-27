.class Lcom/flyersoft/moonreaderp/PrefOptions$ActionBarSearchAdapter;
.super Landroidx/cursoradapter/widget/CursorAdapter;
.source "PrefOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActionBarSearchAdapter"
.end annotation


# instance fields
.field cursor:Landroid/database/Cursor;

.field key:Ljava/lang/String;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefOptions;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefOptions;Landroid/content/Context;Landroid/database/Cursor;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 355
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$ActionBarSearchAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    const/4 p1, 0x1

    .line 356
    invoke-direct {p0, p2, p3, p1}, Landroidx/cursoradapter/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 357
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefOptions$ActionBarSearchAdapter;->cursor:Landroid/database/Cursor;

    .line 358
    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefOptions$ActionBarSearchAdapter;->key:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 3

    const/4 p2, 0x0

    .line 362
    invoke-interface {p3, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p3

    .line 363
    check-cast p1, Landroid/widget/TextView;

    const/4 v0, 0x2

    .line 364
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setLines(I)V

    .line 365
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 366
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, -0x111112

    goto :goto_0

    :cond_0
    const v0, -0xcccccd

    .line 367
    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 369
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions$ActionBarSearchAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->-$$Nest$fgetfuncSearchResults(Lcom/flyersoft/moonreaderp/PrefOptions;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->targetTitle:Ljava/lang/String;

    .line 370
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x50

    if-le v1, v2, :cond_1

    .line 371
    invoke-virtual {v0, p2, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 372
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefOptions$ActionBarSearchAdapter;->key:Ljava/lang/String;

    invoke-static {v0, p2}, Lcom/flyersoft/moonreaderp/PrefChapters;->boldKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 373
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefOptions$ActionBarSearchAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->-$$Nest$fgetfuncSearchResults(Lcom/flyersoft/moonreaderp/PrefOptions;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;->dlgTitle:Ljava/lang/String;

    .line 374
    invoke-static {p3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 375
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<b>"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "</b><br>"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 377
    :cond_2
    invoke-static {p2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 p2, 0x41600000    # 14.0f

    .line 378
    invoke-static {p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p3

    const/high16 v0, 0x41200000    # 10.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-static {p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    invoke-virtual {p1, p3, v1, p2, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    return-void
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 382
    new-instance p2, Landroid/widget/TextView;

    invoke-direct {p2, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    return-object p2
.end method
