.class Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;
.super Ljava/lang/Object;
.source "FormattingAppendableImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConditionalFrame"
.end annotation


# instance fields
.field myInFormatter:Z

.field final myIndent:I

.field final myLineCount:I

.field myLineRef:Lcom/vladsch/flexmark/util/Ref;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final myModCount:I

.field myOnIndent:Z

.field myOnLine:Z

.field final myOpenFormatter:Lcom/vladsch/flexmark/util/html/ConditionalFormatter;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;III)V
    .locals 0

    .line 1067
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1068
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myOpenFormatter:Lcom/vladsch/flexmark/util/html/ConditionalFormatter;

    .line 1069
    iput p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myModCount:I

    .line 1070
    iput p3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myIndent:I

    .line 1071
    iput p4, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myLineCount:I

    const/4 p1, 0x0

    .line 1072
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myLineRef:Lcom/vladsch/flexmark/util/Ref;

    const/4 p1, 0x0

    .line 1073
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myOnIndent:Z

    .line 1074
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myOnLine:Z

    .line 1075
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myInFormatter:Z

    return-void
.end method
