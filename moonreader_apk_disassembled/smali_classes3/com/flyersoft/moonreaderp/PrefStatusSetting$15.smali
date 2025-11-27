.class Lcom/flyersoft/moonreaderp/PrefStatusSetting$15;
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

    .line 287
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$15;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueRecive(I)V
    .locals 1

    .line 290
    sput p1, Lcom/flyersoft/tools/A;->statusFontSize:I

    .line 291
    sget p1, Lcom/flyersoft/tools/A;->statusFontSize:I

    const/4 v0, 0x3

    if-ge p1, v0, :cond_0

    .line 292
    sput v0, Lcom/flyersoft/tools/A;->statusFontSize:I

    .line 293
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$15;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->-$$Nest$mupdateStatusBarProperties(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    return-void
.end method
