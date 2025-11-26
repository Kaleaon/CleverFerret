.class Lcom/flyersoft/moonreaderp/PrefFolderPick$2;
.super Ljava/lang/Object;
.source "PrefFolderPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFolderPick;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 169
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$2;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 172
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$2;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    sget-object v0, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->-$$Nest$mcreateAdapter(Lcom/flyersoft/moonreaderp/PrefFolderPick;Ljava/lang/String;)V

    return-void
.end method
