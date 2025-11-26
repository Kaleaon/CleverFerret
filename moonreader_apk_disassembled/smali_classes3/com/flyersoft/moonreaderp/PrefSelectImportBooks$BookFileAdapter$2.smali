.class Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter$2;
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

    .line 320
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 323
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    .line 324
    check-cast p1, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    iput-boolean p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->selected:Z

    .line 325
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->-$$Nest$msetButtonText(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;)V

    return-void
.end method
