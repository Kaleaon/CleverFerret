.class Lcom/flyersoft/moonreaderp/ActivityTxt$9;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

    .line 1579
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$9;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-wide p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$9;->val$position:J

    iput p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$9;->val$chapter:I

    iput p5, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$9;->val$split:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1581
    iget-wide p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$9;->val$position:J

    sput-wide p1, Lcom/flyersoft/tools/A;->lastPosition:J

    .line 1582
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$9;->val$chapter:I

    sput p1, Lcom/flyersoft/tools/A;->lastChapter:I

    .line 1583
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$9;->val$split:I

    sput p1, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    .line 1584
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$9;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x0

    iput-boolean p2, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->inCloudSyncing:Z

    return-void
.end method
