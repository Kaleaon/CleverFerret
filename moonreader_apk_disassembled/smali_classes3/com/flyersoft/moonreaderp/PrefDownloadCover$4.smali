.class Lcom/flyersoft/moonreaderp/PrefDownloadCover$4;
.super Ljava/lang/Object;
.source "PrefDownloadCover.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefDownloadCover;->downloadFontFile(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 342
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$4;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 344
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$4;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttfCancelled:Z

    return-void
.end method
