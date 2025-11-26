.class Lcom/flyersoft/moonreaderp/ActivityMain$100;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->updateBookFavorites(Landroid/content/Context;Ljava/util/ArrayList;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$books:Ljava/util/ArrayList;

.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$edit:Landroid/widget/EditText;

.field final synthetic val$updateFavList:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/EditText;Landroid/widget/CheckBox;Ljava/util/ArrayList;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9247
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->val$edit:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->val$cb:Landroid/widget/CheckBox;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->val$books:Ljava/util/ArrayList;

    iput-boolean p5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->val$updateFavList:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 9249
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->val$edit:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 9250
    const-string p2, ""

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 9251
    const-string p1, "default_fav"

    .line 9253
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->beginTransition()V

    const/4 p2, 0x0

    const/4 v0, 0x0

    .line 9254
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->val$books:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 9255
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->val$books:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 9256
    iput-object p1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    .line 9257
    invoke-static {v1, p2}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 9259
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->endTransition()V

    .line 9260
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 9261
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->updateWidget(Landroid/content/Context;Z)V

    .line 9262
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFavRvAdapter()V

    .line 9263
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->val$updateFavList:Z

    if-eqz p1, :cond_2

    .line 9264
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$100;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf(Ljava/lang/String;)V

    .line 9265
    sget-object p1, Lcom/flyersoft/components/DualFavLay;->selfPref:Lcom/flyersoft/components/DualFavLay;

    if-eqz p1, :cond_2

    .line 9266
    sget-object p1, Lcom/flyersoft/components/DualFavLay;->selfPref:Lcom/flyersoft/components/DualFavLay;

    invoke-virtual {p1}, Lcom/flyersoft/components/DualFavLay;->initLay1()V

    :cond_2
    return-void
.end method
