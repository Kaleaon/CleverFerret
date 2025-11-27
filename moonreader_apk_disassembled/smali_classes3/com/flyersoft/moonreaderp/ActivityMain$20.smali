.class Lcom/flyersoft/moonreaderp/ActivityMain$20;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$filename:Ljava/lang/String;

.field final synthetic val$requestCode:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 2428
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$20;->val$filename:Ljava/lang/String;

    iput p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$20;->val$requestCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 2430
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$20;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$20;->val$filename:Ljava/lang/String;

    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$20;->val$requestCode:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile2(Ljava/lang/String;IZZ)V

    return-void
.end method
