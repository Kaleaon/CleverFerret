.class Lcom/radaee/util/CaptureSignature$2;
.super Ljava/lang/Object;
.source "CaptureSignature.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/util/CaptureSignature;->initLayout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/util/CaptureSignature;


# direct methods
.method constructor <init>(Lcom/radaee/util/CaptureSignature;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 121
    iput-object p1, p0, Lcom/radaee/util/CaptureSignature$2;->this$0:Lcom/radaee/util/CaptureSignature;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 126
    iget-object p1, p0, Lcom/radaee/util/CaptureSignature$2;->this$0:Lcom/radaee/util/CaptureSignature;

    invoke-virtual {p1}, Lcom/radaee/util/CaptureSignature;->finish()V

    return-void
.end method
