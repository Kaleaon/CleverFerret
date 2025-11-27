.class Lcom/flyersoft/moonreaderp/ActivityMain$139$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$139;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$139;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$139;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 13269
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$139;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 13271
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$139;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$139;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$139;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$139;->val$list:Ljava/util/ArrayList;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdeleteCloudFilesFinial(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/util/ArrayList;)V

    return-void
.end method
