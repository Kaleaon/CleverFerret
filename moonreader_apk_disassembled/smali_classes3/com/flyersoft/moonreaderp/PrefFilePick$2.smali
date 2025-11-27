.class Lcom/flyersoft/moonreaderp/PrefFilePick$2;
.super Ljava/lang/Object;
.source "PrefFilePick.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFilePick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFilePick;

.field final synthetic val$onGetFile:Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;

.field final synthetic val$tv:Lcom/flyersoft/views/EditViewReadOnly;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFilePick;Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;Lcom/flyersoft/views/EditViewReadOnly;)V
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

    .line 39
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$2;->this$0:Lcom/flyersoft/moonreaderp/PrefFilePick;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$2;->val$onGetFile:Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$2;->val$tv:Lcom/flyersoft/views/EditViewReadOnly;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 42
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$2;->val$onGetFile:Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;

    if-eqz p1, :cond_0

    .line 43
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFilePick$2;->val$tv:Lcom/flyersoft/views/EditViewReadOnly;

    invoke-virtual {p2}, Lcom/flyersoft/views/EditViewReadOnly;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;->onGetFile(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
