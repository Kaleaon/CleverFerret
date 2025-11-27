.class Lcom/flyersoft/moonreaderp/PrefMisc$35;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

.field final synthetic val$tv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1074
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$35;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$35;->val$tv:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1077
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$35;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$35;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->shelf_sort_by:I

    const/4 v3, 0x3

    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flyersoft/tools/A;->attachment_save_path:Ljava/lang/String;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefMisc$35$1;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$35$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$35;)V

    invoke-direct {p1, v0, v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefFolderPick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    .line 1083
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->show()V

    return-void
.end method
