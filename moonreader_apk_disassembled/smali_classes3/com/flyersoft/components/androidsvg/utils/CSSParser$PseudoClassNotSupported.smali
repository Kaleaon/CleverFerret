.class Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNotSupported;
.super Ljava/lang/Object;
.source "CSSParser.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClass;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/CSSParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PseudoClassNotSupported"
.end annotation


# instance fields
.field private final clazz:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1083
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1084
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNotSupported;->clazz:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public matches(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1096
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassNotSupported;->clazz:Ljava/lang/String;

    return-object v0
.end method
