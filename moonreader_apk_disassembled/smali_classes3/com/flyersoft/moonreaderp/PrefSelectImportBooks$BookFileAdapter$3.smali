.class Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter$3;
.super Ljava/lang/Object;
.source "PrefSelectImportBooks.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 329
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 332
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    .line 333
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget v1, v1, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->type:I

    if-nez v1, :cond_0

    .line 334
    iget-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->broken:Z

    if-nez v1, :cond_1

    .line 335
    iget-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->selected:Z

    xor-int/lit8 v1, v1, 0x1

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->selected:Z

    .line 336
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->check1:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->selected:Z

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 337
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->-$$Nest$msetButtonText(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;)V

    return-void

    .line 339
    :cond_0
    iget-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->filename:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 340
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->filename:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    :cond_1
    return-void
.end method
