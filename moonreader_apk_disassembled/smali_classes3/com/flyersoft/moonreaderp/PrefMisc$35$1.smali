.class Lcom/flyersoft/moonreaderp/PrefMisc$35$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$35;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefMisc$35;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$35;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1078
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$35$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$35;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 1

    .line 1080
    sput-object p1, Lcom/flyersoft/tools/A;->attachment_save_path:Ljava/lang/String;

    .line 1081
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$35$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$35;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$35;->val$tv:Landroid/widget/TextView;

    sget-object v0, Lcom/flyersoft/tools/A;->attachment_save_path:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
