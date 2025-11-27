.class Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;
.super Ljava/lang/Object;
.source "AttributesOptions.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/options/MutableDataSetter;


# instance fields
.field public final assignTextAttributes:Z

.field public final useEmptyImplicitAsSpanDelimiter:Z

.field public final wrapNonAttributeText:Z


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->ASSIGN_TEXT_ATTRIBUTES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;->assignTextAttributes:Z

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->WRAP_NON_ATTRIBUTE_TEXT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;->wrapNonAttributeText:Z

    .line 16
    sget-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->USE_EMPTY_IMPLICIT_AS_SPAN_DELIMITER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;->useEmptyImplicitAsSpanDelimiter:Z

    return-void
.end method


# virtual methods
.method public setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 2

    .line 21
    sget-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->ASSIGN_TEXT_ATTRIBUTES:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;->assignTextAttributes:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 22
    sget-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->WRAP_NON_ATTRIBUTE_TEXT:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;->wrapNonAttributeText:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 23
    sget-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->USE_EMPTY_IMPLICIT_AS_SPAN_DELIMITER:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;->useEmptyImplicitAsSpanDelimiter:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1
.end method
