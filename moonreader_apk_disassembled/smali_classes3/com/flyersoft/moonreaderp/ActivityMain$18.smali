.class Lcom/flyersoft/moonreaderp/ActivityMain$18;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showZipFileList(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$fullname:Ljava/lang/String;

.field final synthetic val$items:[Ljava/lang/String;

.field final synthetic val$sp:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/Spinner;[Ljava/lang/String;Ljava/lang/String;)V
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

    .line 2337
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$18;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$18;->val$sp:Landroid/widget/Spinner;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$18;->val$items:[Ljava/lang/String;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$18;->val$fullname:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 2339
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$18;->val$sp:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    if-lez p1, :cond_0

    .line 2340
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$18;->val$items:[Ljava/lang/String;

    array-length v0, p2

    add-int/lit8 v0, v0, -0x1

    if-ge p1, v0, :cond_0

    .line 2341
    aget-object p1, p2, p1

    sput-object p1, Lcom/flyersoft/tools/A;->lastZipEncode:Ljava/lang/String;

    sput-object p1, Lcom/flyersoft/tools/compress/MyAntZip;->lastEncode:Ljava/lang/String;

    .line 2342
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$18;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$18;->val$fullname:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowZipFileListFinal(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    return-void
.end method
