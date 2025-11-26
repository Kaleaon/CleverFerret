.class Lcom/flyersoft/moonreaderp/ActivityMain$122;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->initFavRvEvents(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field DEFAULT:Ljava/lang/String;

.field items:[Ljava/lang/String;

.field selected:I

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 10348
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 10350
    iput v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->selected:I

    .line 10351
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->default_favorite_name:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->DEFAULT:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 10354
    const-string p1, "favorite"

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/BookDb;->getDistinctValues(Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object p1

    .line 10355
    sget-object v1, Lcom/flyersoft/tools/A;->recent_fav_name:Ljava/lang/String;

    const-string v2, "default_fav"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, -0x1

    .line 10356
    iput v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->selected:I

    .line 10357
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_0

    const/4 p1, 0x1

    .line 10358
    new-array p1, p1, [Ljava/lang/String;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->items:[Ljava/lang/String;

    .line 10359
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->DEFAULT:Ljava/lang/String;

    aput-object v2, p1, v0

    if-eqz v1, :cond_3

    .line 10361
    iput v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->selected:I

    goto :goto_1

    .line 10363
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->items:[Ljava/lang/String;

    .line 10364
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 10365
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->items:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    aput-object v3, v2, v0

    .line 10366
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->items:[Ljava/lang/String;

    aget-object v2, v2, v0

    sget-object v3, Lcom/flyersoft/tools/A;->recent_fav_name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    if-eqz v1, :cond_2

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->items:[Ljava/lang/String;

    aget-object v2, v2, v0

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->DEFAULT:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 10367
    :cond_1
    iput v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->selected:I

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 10370
    :cond_3
    :goto_1
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p1, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->shelf_favorites:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->items:[Ljava/lang/String;

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->selected:I

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityMain$122$3;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$122$3;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$122;)V

    .line 10371
    invoke-virtual {p1, v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$122$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$122$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$122;)V

    const v1, 0x104000a

    .line 10375
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 10383
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->reset:I

    .line 10385
    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityMain$122$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$122$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$122;)V

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 10392
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
