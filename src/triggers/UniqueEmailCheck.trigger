trigger UniqueEmailCheck on Lead (before insert) {
    UniqueEmailCheckHandler.checkLeadEmail (Trigger.new);
}