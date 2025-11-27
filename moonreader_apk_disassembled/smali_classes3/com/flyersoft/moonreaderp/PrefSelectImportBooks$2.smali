.class Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$2;
.super Ljava/lang/Object;
.source "PrefSelectImportBooks.java"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$OnCloseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 81
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose()Z
    .locals 3

    .line 83
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->phTitle:Landroid/widget/TextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->phTitle:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;

    const-string v2, ""

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->searchFont(Ljava/lang/String;)V

    return v1
.end method
