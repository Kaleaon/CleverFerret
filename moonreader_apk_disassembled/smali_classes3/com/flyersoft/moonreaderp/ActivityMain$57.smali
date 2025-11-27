.class Lcom/flyersoft/moonreaderp/ActivityMain$57;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->doNetLibraryButtons(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$edit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/EditText;)V
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

    .line 5479
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$57;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$57;->val$edit:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 5481
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$57;->val$edit:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 5483
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$57;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetpageStartAt(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    add-int/2addr p1, p2

    .line 5484
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$57;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetpageStartAt(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result p2

    if-lt p1, p2, :cond_0

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$57;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetpageStartAt(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result p2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$57;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mgetTotalPages(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v0

    add-int/2addr p2, v0

    if-ge p1, p2, :cond_0

    .line 5485
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$57;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mgetPageUrl(Lcom/flyersoft/moonreaderp/ActivityMain;I)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$sfgetDOWNLOAD_OK_KEEP()I

    move-result v0

    invoke-static {p2, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mopenBookListFromUrl(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method
