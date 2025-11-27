.class Lcom/flyersoft/moonreaderp/ActivityTxt$8;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showHintForCloudPositionSync()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$chapter:I

.field final synthetic val$position:J

.field final synthetic val$split:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;JII)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
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

    .line 1586
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$8;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-wide p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$8;->val$position:J

    iput p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$8;->val$chapter:I

    iput p5, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$8;->val$split:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2

    const/4 p1, 0x1

    .line 1588
    new-array p1, p1, [Ljava/lang/Object;

    const/4 v0, 0x0

    const-string v1, "*sync cancel"

    aput-object v1, p1, v0

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1589
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$8;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->inCloudSyncing:Z

    if-eqz p1, :cond_0

    .line 1590
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$8;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->inCloudSyncing:Z

    .line 1591
    iget-wide v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$8;->val$position:J

    sput-wide v0, Lcom/flyersoft/tools/A;->lastPosition:J

    .line 1592
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$8;->val$chapter:I

    sput p1, Lcom/flyersoft/tools/A;->lastChapter:I

    .line 1593
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$8;->val$split:I

    sput p1, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    :cond_0
    return-void
.end method
