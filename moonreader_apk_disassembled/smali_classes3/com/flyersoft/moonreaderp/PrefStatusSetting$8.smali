.class Lcom/flyersoft/moonreaderp/PrefStatusSetting$8;
.super Ljava/lang/Object;
.source "PrefStatusSetting.java"

# interfaces
.implements Lcom/flyersoft/views/CustomSeek$OnProgressChanged;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefStatusSetting;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 202
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$8;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueRecive(I)V
    .locals 0

    .line 205
    sput p1, Lcom/flyersoft/tools/A;->chapterMarginStatus:I

    .line 206
    invoke-static {}, Lcom/flyersoft/tools/A;->verifyChapterMargin()V

    .line 207
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$8;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->-$$Nest$mupdateStatusBarProperties(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    return-void
.end method
