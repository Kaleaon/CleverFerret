.class Lcom/flyersoft/moonreaderp/PrefShelf$16$1;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf$16;->onGetFolder(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefShelf$16;

.field final synthetic val$folder:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf$16;Ljava/lang/String;)V
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

    .line 710
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$16;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16$1;->val$folder:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 712
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$16;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/PrefShelf$16;->val$oldMainFolder:Ljava/lang/String;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$16$1;->val$folder:Ljava/lang/String;

    invoke-static {p1, p2, v0}, Lcom/flyersoft/moonreaderp/PrefShelf$16;->-$$Nest$mshowMoveCacheTip(Lcom/flyersoft/moonreaderp/PrefShelf$16;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
