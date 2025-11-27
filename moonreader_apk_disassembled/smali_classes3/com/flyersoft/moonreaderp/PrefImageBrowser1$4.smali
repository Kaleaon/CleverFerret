.class Lcom/flyersoft/moonreaderp/PrefImageBrowser1$4;
.super Ljava/lang/Object;
.source "PrefImageBrowser1.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->doFindImages()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 185
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$4;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$4;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->pathEdit:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$4;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->-$$Nest$mfindImages(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;)V

    return-void
.end method
